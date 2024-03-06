//
//  ContentView.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/05.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedConvertTab: ConvertTab = .convertTo
    @State private var selectedCurrencyTab: CurrencyTab = .usd
    @State private var amountToConvert: String = ""
    @State private var conversionResult = "0"
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                
                Image(systemName: "multiply")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
            }
            .padding(.trailing, 24)
            
            Spacer()
            
            ConvertTabs(activeTab: $selectedConvertTab)
                .onChange(of: selectedConvertTab) {
                    performConversion()
                }
            
            Spacer()
            
            CurrencyTabs(activeTab: $selectedCurrencyTab)
                .onChange(of: selectedCurrencyTab) {
                    performConversion()
                }
            
            ConvertInputField(amountToConvert: $amountToConvert)
                .onChange(of: amountToConvert) {
                    performConversion()
                }
                        
            Spacer()
            
            Text("is approximately")
                .font(.custom("Helvetica Neue", size: 32))
                .fontWeight(.medium)
            Text(conversionResult)
                .font(.custom("Helvetica Neue", size: 64))
                .fontWeight(.medium)
                .frame(minHeight: 76)
            Text(selectedConvertTab == .convertTo ? "JPY" : selectedCurrencyTab.rawValue)
                .font(.custom("Helvetica Neue", size: 32))
                .fontWeight(.medium)
            
            Spacer()
            
            Button {

            } label: {
                Text("Convert")
                    .font(.custom("Helvetica Neue", size: 16))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 20)
            }
            .background(Color.black)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black, lineWidth: 1)
            )
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
                .padding([.trailing], 28)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RadialGradient(
            gradient: Gradient(colors: [Color(hex: "#FFEAFF"), Color(hex: "#AFECFF")]),
            center: UnitPoint(x: 0.9, y: 0.3),
            startRadius: 60,
            endRadius: 500
        ))
    }
    
    func performConversion() {
        let convertFrom = selectedConvertTab == .convertTo ? Currency.jpy : selectedCurrencyTab.toCurrency()
        let convertTo = selectedConvertTab == .convertTo ? selectedCurrencyTab.toCurrency() : Currency.jpy
        
        conversionResult = convertAmount(amountToConvert, from: convertFrom, to: convertTo)
    }
    
    func convertAmount(_ amount: String, from: Currency, to: Currency) -> String {
        guard let amountAsDouble = Double(amount) else { return "" }
        
        let convertedValue = (amountAsDouble / from.rawValue) * to.rawValue
        
        return String(format: "%.0f%", convertedValue)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue:  Double(b) / 255, opacity: Double(a) / 255)
    }
}

#Preview {
    ContentView()
}
