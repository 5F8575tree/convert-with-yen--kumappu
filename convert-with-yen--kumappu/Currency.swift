//
//  Currency.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case jpy = 140
    case usd = 100
    case gbp = 60
    case cad = 200
    case eur = 50
    case aus = 150
    
    var id: Double { rawValue }
    
    func convertValue(_ amountString: String, changeInto currency: Currency) -> String {
        guard let doubledAmount = Double(amountString) else {
            return ""
        }
        
        let convertedValue = (doubledAmount / self.rawValue) * currency.rawValue
        
        return String(format: "%.0f%", convertedValue)
    }
}
