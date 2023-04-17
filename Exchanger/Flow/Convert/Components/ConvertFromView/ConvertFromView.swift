//
//  ConvertFromView.swift
//  Exchanger
//
//  Created by Andrew Trach on 16.04.2023.
//

import SwiftUI

struct ConvertFromView: View {
    
    private enum Constants {
        static let placeholder = "1"
        static let delay = 0.5
    }
    
    // MARK: - Wrapped Properties
    @ObservedObject var viewModel: ConvertFromViewModel
    @FocusState var focusedField: Bool
    
    // MARK: - Body View
    var body: some View {
        HStack {
            Text(viewModel.currencyFrom)
            Spacer()
            TextField(Constants.placeholder, text: $viewModel.valueFrom)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .fixedSize(horizontal: true, vertical: false)
                .focused($focusedField)
                .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delay) {
                        focusedField = true
                    }
                }
        }
        Divider()
    }
}
