//
//  ExchangerClient.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation
import Combine

protocol ExchangerClientProtocol {
    func getExchangerate() -> AnyPublisher<CurrencyModel, Error>
    func getConvert(from: String, to: String, amount: String) -> AnyPublisher<Convert, Error>
}

final class ExchangerClient: ExchangerClientProtocol {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getExchangerate() -> AnyPublisher<CurrencyModel, Error> {
        networkService.performRequest(route: ExchangerRouter(endpoint: .getExchangerate))
    }
    
    func getConvert(from: String, to: String, amount: String) -> AnyPublisher<Convert, Error> {
        networkService.performRequest(route: ExchangerRouter(endpoint: .getConvert(from: from, to: to, amount: amount)))
    }
}
