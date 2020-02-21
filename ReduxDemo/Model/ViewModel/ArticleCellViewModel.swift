//
//  ArticleCellViewModel.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/13.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

class ArticleCellViewModel: Identifiable, Codable {
    
    var id: String {
        return (article?.title ?? "") + (article?.url ?? "")
    }

    private var article: Article?

    init(article: Article) {
        self.article = article
    }

    var author: String {
        return article?.author ?? ""
    }

    var title: String {
        return article?.title ?? ""
    }

    var desc: String {
        return article?.desc ?? ""
    }

    var content: String {
        return article?.content ?? ""
    }

    var publishedAt: String {
        return article?.publishedAt?.asString(style: .full) ?? ""
    }

    var imageURL: URL? {
        guard let usrString = article?.urlToImage else { return nil }
        return URL(string: usrString)
    }

    var linkURL: URL? {
        guard let usrString = article?.url else { return nil }
        return URL(string: usrString)
    }

}
