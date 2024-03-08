//
//  Currency.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import SwiftUI

enum Currency: String, CaseIterable, Identifiable {
    case jpy, usd, gbp, cad, eur, aud
    
    var id: String { self.rawValue }
}
