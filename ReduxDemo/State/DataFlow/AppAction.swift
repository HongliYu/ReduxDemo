//
//  AppAction.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

enum AppAction {
    case loadArticles
    case loadArticlesDone(result: Result<[ArticleCellViewModel], AppError>)
    case openSafariView(viewModel: ArticleCellViewModel)
    case closeSafariView
}
