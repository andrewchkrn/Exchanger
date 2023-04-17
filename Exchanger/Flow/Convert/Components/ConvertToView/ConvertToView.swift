//
//  ConvertToView.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import SwiftUI

struct ConvertToView: View {
    
    // MARK: - Wrapped Properties
    @ObservedObject var viewModel: ConvertToViewModel
    
    // MARK: - Body View
    var body: some View {
        HStack {
            Text(viewModel.currencyTo)
            Spacer()
            Text(viewModel.valueTo)
        }
        Divider()
    }
}
