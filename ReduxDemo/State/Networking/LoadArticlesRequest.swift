//
//  LoadArticlesRequest.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation
import Combine

struct LoadArticlesRequest {
    
    let url: URL
    
    var publisher: AnyPublisher<[ArticleCellViewModel], AppError> {
        articleListPublisher(url)
            .mapError { AppError.networkingFailed($0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    private func articleListPublisher(_ url: URL) -> AnyPublisher<[ArticleCellViewModel], Error> {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ArticleList.self, decoder: JSONDecoderEncoderBuilder().buildDecoder())
            .flatMap({ articleList -> AnyPublisher<[ArticleCellViewModel], Error> in
                guard let articles = articleList.articles else {
                    return Just([ArticleCellViewModel]())
                        .setFailureType(to: Error.self)
                        .eraseToAnyPublisher()
                }
                return articles.compactMap { ArticleCellViewModel(article: $0) }
                    .publisher
                    .collect()
                    .mapError { AppError.networkingFailed($0) }
                    .eraseToAnyPublisher()
            })
            .eraseToAnyPublisher()
    }

}
