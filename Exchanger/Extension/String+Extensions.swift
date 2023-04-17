//
//  String+Extensions.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import Foundation

extension String {

    static var empty: String {
        String()
    }

    var deletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }

    var pathExtension: String {
        return NSString(string: self).pathExtension
    }
    
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}

extension String: Identifiable {
    
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
