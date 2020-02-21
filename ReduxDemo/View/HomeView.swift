//
//  HomeView.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var store: Store

    var body: some View {
        ArticleRootView()
    }

}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Store.sample)
    }
}
#endif
