//
//  FavoritesCoordinator.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import FlowStacks
import SwiftUI

struct FavoritesCoordinator: View {
    
    // MARK: - Wrapped Properties
    @StateObject var viewModel: FavoritesCoordinatorViewModel
    
    // MARK: - Body View
    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .home:
                FavoritesView(viewModel: FavoritesViewModel(onEvent: { event in
                    switch event {
                    case .showNext(let key):
                        viewModel.showConvert(key: key)
                    }
                }))
            case .convert(let viewModel):
                ConvertView(viewModel: viewModel)
            }
        }
    }
}
