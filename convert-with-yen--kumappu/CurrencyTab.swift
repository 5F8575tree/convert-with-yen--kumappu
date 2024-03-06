//
//  CurrencyTab.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import Foundation

enum CurrencyTab: String, CaseIterable {
    case usd = "USD", gbp = "GBP", aus = "AUS", cad = "CAD", eur = "EUR"
    
    func toCurrency() -> Currency {
        switch self {
        case .usd: return .usd
        case .gbp: return .gbp
        case .aus: return .aus
        case .cad: return .cad
        case .eur: return .eur
        }
    }
}
