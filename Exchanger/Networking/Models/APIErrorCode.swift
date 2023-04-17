//
//  APIErrorCode.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

enum APIErrorCode: String {
    // MARK: - Default
    case `default` = "default_error_code"
}

extension APIErrorCode {
    var localizedMessage: String {
        rawValue.localized()
    }
}
