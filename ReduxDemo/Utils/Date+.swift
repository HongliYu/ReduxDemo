//
//  Date+.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/13.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

extension Date {

    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }

}
