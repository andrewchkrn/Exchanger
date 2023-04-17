//
//  ConvertViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 15.04.2023.
//

import SwiftUI
import Combine

class ConvertViewModel: ObservableObject {
    
    // MARK: - Wrapped Properties
    @Published var valueFrom = ""
    @Published var valueTo = ""
    
    // MARK: - Properties
    var currencyFrom: String
    let currencyTo: String = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter.currencyCode
    }()
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(currencyFrom: String) {
        self.currencyFrom = currencyFrom
    }
    
    // MARK: - Public func
    func onChange() {
        convertValue()
    }
    
    func onAppear() {
        convertValue()
    }
    
    // MARK: - Private func
    private func convertValue() {
        APIClient.exchangerClient.getConvert(from: currencyFrom, to: currencyTo , amount: valueFrom)
            .sink { [weak self] in
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] data in
                self?.valueTo = String(data.result)
            }
            .store(in: &subscriptions)
    }
}
