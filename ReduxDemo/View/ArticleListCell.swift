//
//  ArticleListCell.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/17.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ArticleListCell: View {
    
    @EnvironmentObject var store: Store
    
    let viewModel: ArticleCellViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            Text(viewModel.title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            KFImage(viewModel.imageURL).placeholder {
                Text("Image placeholder")
            }
            .resizable()
            .aspectRatio(contentMode: .fit)
            Text(viewModel.author)
                .font(.system(size: 16, weight: .regular))
                .italic()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(viewModel.desc)
                .font(.system(size: 14, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(viewModel.publishedAt)
                .font(.system(size: 14, weight: .medium))
            .frame(maxWidth: .infinity, alignment: .trailing)
        }.onTapGesture {
            self.store.dispatch(.openSafariView(viewModel: self.viewModel))
        }
    }
    
}

struct ToolButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
    }
}

#if DEBUG
struct ArticleListCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ArticleListCell(viewModel: ArticleCellViewModel.sample)
        }.environmentObject(Store())
    }
}
#endif
