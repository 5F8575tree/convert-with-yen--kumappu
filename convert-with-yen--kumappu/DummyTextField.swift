//
//  DummyTextField.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/08.
//

import SwiftUI

struct DummyTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var isFirstResponder: Bool

        init(isFirstResponder: Binding<Bool>) {
            _isFirstResponder = isFirstResponder
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            isFirstResponder = false
            textField.resignFirstResponder()
            return true
        }
    }

    @Binding var isFirstResponder: Bool

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.isHidden = true
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        if isFirstResponder {
            uiView.becomeFirstResponder()
        } else {
            uiView.resignFirstResponder()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isFirstResponder: $isFirstResponder)
    }
}

