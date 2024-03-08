//
//  UIApplication.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/07.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

