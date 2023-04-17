//
//  ConvertView.swift
//  Exchanger
//
//  Created by Andrew Trach on 15.04.2023.
//

import SwiftUI

struct ConvertView: View {
    
    private enum Constants {
        static let padding: CGFloat = 16.0
    }
    
    // MARK: - Wrapped Properties
    @StateObject var viewModel: ConvertViewModel
    
    // MARK: - Body View
    var body: some View {
        NavigationStack{
            VStack {
                
                ConvertFromView(viewModel: ConvertFromViewModel( valueFrom: $viewModel.valueFrom, currencyFrom: viewModel.currencyFrom))
                    .onChange(of: viewModel.valueFrom) { _ in
                        viewModel.onChange()
                    }
                
                ConvertToView(viewModel: ConvertToViewModel(currencyTo: viewModel.currencyTo, valueTo: viewModel.valueTo))
                
                Spacer()
            }
            .padding(Constants.padding)
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView(viewModel: ConvertViewModel(currencyFrom: "US"))
    }
}
