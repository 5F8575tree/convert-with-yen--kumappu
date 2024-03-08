//
//  ConvertInputField.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import SwiftUI

struct ConvertInputField: View {
    @Binding var amountToConvert: String
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        TextField("Amount to convert", text: $amountToConvert)
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.trailing)
            .accentColor(.black)
            .focused($isTextFieldFocused)
            .frame(height: 56)
            .frame(maxWidth: 216)
            .padding(.trailing)
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 1.5)
            )
            .padding(.bottom, 24)
            .font(.custom("Helvetica Neue", size: 18))
    }
}

#Preview {
    ConvertInputField(amountToConvert: .constant("500"))
}
