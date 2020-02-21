//
//  Source.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/13.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

struct Source: Codable {

    let identifier: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }

}
