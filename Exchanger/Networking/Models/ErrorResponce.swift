//
//  ErrorResponse.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

struct ErrorResponse: Decodable {
    let code: String
    let message: String

    var apiError: APIError {
        .default(code: code)
    }
}
