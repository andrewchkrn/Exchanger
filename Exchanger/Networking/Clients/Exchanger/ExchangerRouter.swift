//
//  ExchangerRouter.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

enum ExchangerEndpoint {
    case getExchangerate
    case getConvert(from: String, to: String, amount: String)
}

final class ExchangerRouter: BaseRouter {

    private let endpoint: ExchangerEndpoint

    init(endpoint: ExchangerEndpoint) {
        self.endpoint = endpoint
    }

    override var path: String {
        switch endpoint {
        case .getExchangerate:
            return "/latest"
        case .getConvert:
            return "/convert"
        }
    }

    override var method: HTTPMethod {
        switch endpoint {
        case .getExchangerate, .getConvert:
            return .get
        }
    }
    
    override var queryItems: [URLQueryItem]? {
        switch endpoint {
        case .getExchangerate:
            return nil
        case .getConvert(let from, let to, let amount):
            return [URLQueryItem(name: "from", value: from), URLQueryItem(name: "to", value: to), URLQueryItem(name: "amount", value: amount)]
        }
    }

    override var body: Data? {
        switch endpoint {
        case .getExchangerate, .getConvert:
            return nil
        }
    }
}
