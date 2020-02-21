//
//  AppState.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation
import Combine

struct AppState {

    struct ArticleList {
        var loadingError: AppError?
        var viewModels: [ArticleCellViewModel]?
        var selectedViewModel: ArticleCellViewModel?
    }

    var articleList = ArticleList()

}
