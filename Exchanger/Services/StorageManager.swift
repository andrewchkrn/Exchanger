//
//  StorageManager.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import SwiftUI

class StorageManager: ObservableObject {
    
    private enum Constants {
        static let key = "appfavorites"
    }
    
    static let shared = StorageManager()
    @AppStorage(Constants.key) var favorites = [String]() {
        willSet { objectWillChange.send() }
    }
}
