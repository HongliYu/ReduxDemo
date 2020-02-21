//
//  ArticleRootView.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import SwiftUI

struct ArticleRootView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            containedView(store.appState.articleList.viewModels)
        }
    }

    func containedView(_ viewModels: [ArticleCellViewModel]?) -> some View {
        if viewModels == nil {
            return AnyView(LoadingView(isShowing: .constant(true)).onAppear {
                self.store.dispatch(.loadArticles)
            })
        }
        if let url = store.appState.articleList.selectedViewModel?.linkURL {
            return AnyView(SafariView(url: url,
                                      onFinished: {
                                        self.store.dispatch(.closeSafariView)
            }).navigationBarTitle(Text("newsapi.org"), displayMode: .inline))
        }
        return AnyView(ArticleListView().navigationBarTitle("newsapi.org"))
    }

}

#if DEBUG
struct ArticleRootView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRootView().environmentObject(Store.sample)
    }
}
#endif
