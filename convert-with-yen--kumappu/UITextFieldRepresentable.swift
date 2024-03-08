//
//  UITextFieldRepresentable.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/08.
//

import SwiftUI

struct UITextFieldRepresentable: UIViewRepresentable {
    @Binding var text: String
    @FocusState var isTextFieldFocused: Bool
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var isTextFieldFocused: FocusState<Bool>.Binding

        init(text: Binding<String>, isTextFieldFocused: FocusState<Bool>.Binding) {
            self._text = text
            self._isTextFieldFocused = isTextFieldFocused
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        @objc func doneButtonTapped() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            isTextFieldFocused.wrappedValue = false
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text, isTextFieldFocused: _isTextFieldFocused)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .decimalPad

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))
        toolbar.setItems([flexSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

