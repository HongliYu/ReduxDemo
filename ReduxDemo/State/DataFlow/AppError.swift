//
//  AppError.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

enum AppError: Error, Identifiable {
    var id: String { localizedDescription }
    case alreadyRegistered
    case passwordWrong
    case requiresLogin
    case networkingFailed(Error)
    case fileError
}

extension AppError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .alreadyRegistered: return "Account has been registered"
        case .passwordWrong: return "Wrong password"
        case .requiresLogin: return "Please login"
        case .networkingFailed(let error): return error.localizedDescription
        case .fileError: return "File error"
        }
    }
}
