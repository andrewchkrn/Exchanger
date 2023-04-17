//
//  CurrencyCoordinatorViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import Foundation
import FlowStacks

class CurrencyCoordinatorViewModel: ObservableObject {
    
    enum Screen {
        case home
        case convert(viewModel: ConvertViewModel)
    }
    
    // MARK: - Wrapped Properties
    @Published var routes: Routes<Screen> = [.root(.home, embedInNavigationView: true)]
    
    // MARK: - Public func
    func showConvert(key: String) {
        let viewModel = ConvertViewModel(currencyFrom: key)
        routes.push(.convert(viewModel: viewModel))
    }
}
