//
//  CurrencyViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 15.04.2023.
//

import Combine

class CurrencyViewModel: ObservableObject {
    
    enum Event {
        case showNext(key: String)
    }
    
    // MARK: - Wrapped Properties
    @Published var searchText = ""
    @Published var exchangerate = [String]()
    @Published private var storage = StorageManager.shared
    
    // MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    private let onEvent: (Event) -> Void
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return exchangerate.sorted { $0.uppercased() < $1.uppercased() }
        } else {
            return exchangerate.filter { $0.contains(searchText.uppercased()) }.sorted { $0.uppercased() < $1.uppercased() }
        }
    }
    
    init(onEvent: @escaping (Event) -> Void) {
        self.onEvent = onEvent
        objectWillChange()
    }
    
    // MARK: - Public func
    func rowTapped(key: String) {
        onEvent(.showNext(key: key))
    }
    
    func isFavorites(item: String) -> Bool {
        return storage.favorites.contains(where: { $0 == "\(item)" })
    }
    
    func favoritesList(item: String) {
        if storage.favorites.contains(where: { $0 == "\(item)" }) {
            if let index = storage.favorites.firstIndex(of: "\(item)") {
                storage.favorites.remove(at: index)
            }
        } else {
            storage.favorites.append(item)
        }
    }
    
    func onAppear() {
        APIClient.exchangerClient.getExchangerate()
            .sink { [weak self] in
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] data in
                self?.exchangerate.removeAll()
                self?.exchangerate = data.rates.map { "\($0.key)" }
            }
            .store(in: &subscriptions)
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
