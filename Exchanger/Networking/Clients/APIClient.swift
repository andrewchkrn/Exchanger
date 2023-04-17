//
//  APIClient.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

struct APIClient {

    private static let networkService = NetworkService()

    static let exchangerClient = ExchangerClient(networkService: networkService)
}
