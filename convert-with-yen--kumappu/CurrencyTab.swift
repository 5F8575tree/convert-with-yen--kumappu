//
//  CurrencyTab.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import Foundation

enum CurrencyTab: String, CaseIterable {
    case usd = "USD", gbp = "GBP", aud = "AUD", cad = "CAD", eur = "EUR"
    
    func toCurrency() -> Currency {
        switch self {
        case .usd: return .usd
        case .gbp: return .gbp
        case .aud: return .aud
        case .cad: return .cad
        case .eur: return .eur
        }
    }
}
