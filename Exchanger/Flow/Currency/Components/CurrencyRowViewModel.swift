//
//  CurrencyRowViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import Foundation

class CurrencyRowViewModel: ObservableObject {
    
    // MARK: - Wrapped Properties
    @Published var title: String
    @Published var isFavorite: Bool
    
    // MARK: - Properties
    let onTappedRow: () -> Void
    let onTappedFavirite: () -> Void
    
    init(title: String, isFavorite: Bool, onTappedRow: @escaping () -> Void, onTappedFavirite: @escaping () -> Void) {
        self.title = title
        self.isFavorite = isFavorite
        self.onTappedRow = onTappedRow
        self.onTappedFavirite = onTappedFavirite
    }
}
