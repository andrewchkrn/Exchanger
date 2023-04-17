//
//  FavoritesCoordinatorViewModel.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import Foundation
import FlowStacks

class FavoritesCoordinatorViewModel: ObservableObject {
    
    enum Screen {
        case home
        case convert(viewModel: ConvertViewModel)
    }
    
    @Published var routes: Routes<Screen> = [.root(.home, embedInNavigationView: true)]
    
    func showConvert(key: String) {
        let viewModel = ConvertViewModel(currencyFrom: key)
        routes.push(.convert(viewModel: viewModel))
    }
}
