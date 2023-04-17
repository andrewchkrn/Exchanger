//
//  CurrencyView.swift
//  Exchanger
//
//  Created by Andrew Trach on 14.04.2023.
//

import SwiftUI

struct CurrencyView: View {
    
    // MARK: - Wrapped Properties
    @StateObject var viewModel: CurrencyViewModel
    
    // MARK: - Body View
    var body: some View {
        NavigationStack{
            VStack {
                List(viewModel.searchResults) { item in
                    
                    CurrencyRowView(viewModel: CurrencyRowViewModel(title: item.description,
                                                                isFavorite: viewModel.isFavorites(item: item.description),
                                                                onTappedRow: {
                                                                viewModel.rowTapped(key: item.description)},
                                                                onTappedFavirite: {
                                                                viewModel.favoritesList(item: item) }))
                }
                .onAppear() {
                    viewModel.onAppear()
                }
                .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
        }
    }
}
