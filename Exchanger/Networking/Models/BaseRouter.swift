//
//  BaseRouter.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

class BaseRouter {

    var baseUrl: String {
        "https://api.exchangerate.host"
    }

    var method: HTTPMethod {
        fatalError("You have to override method property")
    }

    var path: String {
        return .empty
    }

    var headers: [String: String]? {
        return nil
    }

    var queryItems: [URLQueryItem]? {
        return nil
    }

    var body: Data? {
        return nil
    }

    func asURLRequest() throws -> URLRequest {

        var components = URLComponents(string: baseUrl)!

        components.path = path
        components.queryItems = queryItems

        var request = URLRequest(url: components.url!)

        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        headers?.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }
}
