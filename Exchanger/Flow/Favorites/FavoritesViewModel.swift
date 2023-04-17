//
//  FavoritesViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 15.04.2023.
//

import SwiftUI
import Combine

class FavoritesViewModel: ObservableObject {
    
    enum Event {
        case showNext(key: String)
    }
    
    // MARK: - Wrapped Properties
    @Published var storage = StorageManager.shared
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    private let onEvent: (Event) -> Void
    
    var favorites: [String] {
        return  storage.favorites.sorted { $0.uppercased() < $1.uppercased() }
    }
    
    init(onEvent: @escaping (Event) -> Void) {
        self.onEvent = onEvent
        objectWillChange()
    }
    
    // MARK: - Public func
    func rowTapped(key: String) {
        onEvent(.showNext(key: key))
    }
    
    func delete(at offsets: IndexSet) {
        storage.favorites.remove(atOffsets: offsets)
    }
    
    // MARK: - Private func
    private func objectWillChange() {
        storage.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &subscriptions)
    }
}
