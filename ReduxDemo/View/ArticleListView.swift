//
//  ArticleListView.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import SwiftUI

struct ArticleListView: View {

    @EnvironmentObject var store: Store
    
    var articleList: AppState.ArticleList { store.appState.articleList }

    var body: some View {
        List(store.appState.articleList.viewModels ?? [ArticleCellViewModel]()) { viewModel in
            ArticleListCell(viewModel: viewModel)
        }
    }
    
}

#if DEBUG
struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView().environmentObject(Store.sample)
    }
}
#endif
