//
//  CurrencyCoordinator.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import FlowStacks
import SwiftUI

struct CurrencyCoordinator: View {
    
    // MARK: - Wrapped Properties
    @StateObject var viewModel: CurrencyCoordinatorViewModel
    
    // MARK: - Body View
    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .home:
                CurrencyView(viewModel: CurrencyViewModel(onEvent: { event in
                    switch event {
                    case let .showNext(key):
                        viewModel.showConvert(key: key)
                    }
                }))
            case .convert(let viewModel):
                ConvertView(viewModel: viewModel)
            }
        }
    }
}
