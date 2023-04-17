//
//  FavoritesView.swift
//  Exchanger
//
//  Created by Andrew Trach on 15.04.2023.
//

import SwiftUI

struct FavoritesView: View {
    
    // MARK: - Wrapped Properties
    @StateObject var viewModel: FavoritesViewModel
    
    // MARK: - Body View
    var body: some View {
        List {
            ForEach(viewModel.favorites, id: \.self) { item in
                Button {
                    viewModel.rowTapped(key: item)
                } label: {
                    Text(item)
                }
            }
            .onDelete(perform: viewModel.delete)
        }
    }
}
