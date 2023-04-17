//
//  EmptyResponse.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

struct EmptyResponse: Codable { }

extension Encodable {
    var data: Data? {
        try? CodableService.defaultEncoder.encode(self)
    }
}
