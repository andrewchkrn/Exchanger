//
//  ConvertFromViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import SwiftUI
import Foundation

class ConvertFromViewModel: ObservableObject {
    
    // MARK: - Wrapped Properties
    @Binding var valueFrom: String
    
    // MARK: - Properties
    var currencyFrom: String
   
    init(valueFrom: Binding<String>, currencyFrom: String) {
        self._valueFrom = valueFrom
        self.currencyFrom = currencyFrom
    }
}
