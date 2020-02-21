//
//  Store.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/13.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Combine

class Store: ObservableObject {
    
    @Published var appState = AppState()

    func dispatch(_ action: AppAction) {
        debugPrint("[ACTION]: \(action)")
        let result = Store.reduce(state: appState, action: action)
        appState = result.0
        if let command = result.1 {
            debugPrint("[COMMAND]: \(command)")
            command.execute(in: self)
        }
    }
    
    static func reduce(state: AppState, action: AppAction) -> (AppState, AppCommand?) {
        var appState = state
        var appCommand: AppCommand?
        switch action {
        case .loadArticles:
            appCommand = LoadArticlesCommand()
        case .loadArticlesDone(let result):
            switch result {
            case .success(let viewModels):
                appState.articleList.viewModels = viewModels
            case .failure(let error):
                appState.articleList.loadingError = error
            }
        case .openSafariView(let viewModel):
            appState.articleList.selectedViewModel = viewModel
        case .closeSafariView:
            appState.articleList.selectedViewModel = nil
        }
        return (appState, appCommand)
    }
    
}
