//
//  AppCommand.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation
import Combine

protocol AppCommand {
    func execute(in store: Store)
}

struct LoadArticlesCommand: AppCommand {
    
    func execute(in store: Store) {
        let endpoint = String(format: Endpoints.topHeadlines)
        var components = URLComponents()
        components.scheme = Environment.debug.scheme
        components.host = Environment.debug.baseURL
        components.path = endpoint
        components.queryItems = [URLQueryItem(name: "country", value: "us"),
                                 URLQueryItem(name: "apiKey", value: Secrets.apiKey)]
        guard let requestURL = components.url else {
            assertionFailure("Failed to construct URL")
            return
        }
        let token = SubscriptionToken()
        LoadArticlesRequest(url: requestURL)
            .publisher
            .sink(receiveCompletion: { complete in
                if case .failure(let error) = complete {
                    store.dispatch(.loadArticlesDone(result: .failure(error)))
                }
                token.unseal()
            }, receiveValue: { value in
                store.dispatch(.loadArticlesDone(result: .success(value)))
            }
        ).seal(in: token)
    }
    
}

class SubscriptionToken {
    var cancellable: AnyCancellable?
    func unseal() {
        cancellable = nil
    }
}

extension AnyCancellable {
    func seal(in token: SubscriptionToken) {
        token.cancellable = self
    }
}
