//
//  CurrencyRowView.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import SwiftUI

struct CurrencyRowView: View {
    
    private enum Constants {
        static let remove = "Remove"
        static let add = "Add"
    }
    
    // MARK: - Wrapped Properties
    @ObservedObject var viewModel: CurrencyRowViewModel
    
    // MARK: - Body View
    var body: some View {
        HStack {
            Button {
                viewModel.onTappedRow()
            } label: {
                HStack {
                    Text(viewModel.title)
                    Spacer()
                }
            }
            .buttonStyle(.automatic)
            
            Button {
                viewModel.onTappedFavirite()
            } label: {
                Text(viewModel.isFavorite ? Constants.remove : Constants.add)
            }
            .buttonStyle(.bordered)
        }
    }
}
