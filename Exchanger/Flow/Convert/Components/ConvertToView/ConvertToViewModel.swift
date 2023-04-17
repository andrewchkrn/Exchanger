//
//  ConvertToViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import Foundation

class ConvertToViewModel: ObservableObject {
    
    // MARK: - Properties
    var currencyTo: String
    var valueTo: String
    
    init(currencyTo: String, valueTo: String) {
        self.currencyTo = currencyTo
        self.valueTo = valueTo
    }
}
