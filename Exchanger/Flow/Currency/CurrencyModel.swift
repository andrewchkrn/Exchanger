//
//  CurrencyModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

// MARK: - Exchangerate
struct CurrencyModel: Codable, Hashable {
    var rates: [String: Double]
}
