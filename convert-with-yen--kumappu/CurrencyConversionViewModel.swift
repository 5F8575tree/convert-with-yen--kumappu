//
//  CurrencyConversionViewModel.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import Foundation

class CurrencyConversionViewModel: ObservableObject {
    @Published var exchangeRates = [Currency: Double]()
    
    func convertValue(_ amountString: String, fromCurrency: Currency, toCurrency: Currency) -> String {
        guard let amount = Double(amountString),
              let fromRate = exchangeRates[fromCurrency],
              let toRate = exchangeRates[toCurrency] else {
            return ""
        }
        
        let baseValue = amount / fromRate
        let convertedValue = baseValue * toRate
        
        return String(format: "%.2f", convertedValue)
    }

    func loadExchangeRates() {
        ExchangeRateService().fetchExchangeRates { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let rates):
                    self.exchangeRates = rates
                case .failure(let error):
                    print("Failed to fetch exchange rates: \(error.localizedDescription)")
                }
            }
        }
    }
}
