//
//  ExchangerApp.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import SwiftUI

@main
struct ExchangerApp: App {
    
    enum Tab: Hashable {
        case allCurencies
        case myCurencies
    }
    
    @State var selectedTab: Tab = .allCurencies
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                CurrencyCoordinator(viewModel: CurrencyCoordinatorViewModel())
                    .tabItem { Text("All curencies") }
                    .tag(Tab.allCurencies)
                
                FavoritesCoordinator(viewModel: FavoritesCoordinatorViewModel())
                    .tabItem { Text("My currencies") }
                    .tag(Tab.myCurencies)
            }
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.5), value: selectedTab)
        }
    }
}
