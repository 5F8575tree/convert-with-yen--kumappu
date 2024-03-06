//
//  ContentView.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/05.
//

import SwiftUI

struct ContentView: View {
    @State var amountToConvert = ""
    
    var body: some View {
        
        VStack {
            // close
            HStack {
                Spacer()
                
                Image(systemName: "multiply")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
            }
            .padding(.trailing, 24)
            
            Spacer()
            
            // to-from tabs
            HStack {
                Spacer()
                // convert to
                Text("Convert to")
                    .padding(.vertical, 3)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(200)
                    .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 4)
                    .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 1)
                    .font(.custom("Helvetica Neue", size: 14))
            
                Spacer()
                
                // convert from
                Text("Convert from")
                    .padding(.vertical, 3)
                    .frame(maxWidth: .infinity)
                    .font(.custom("Helvetica Neue", size: 14))
                
                Spacer()
            }
            .padding(.vertical, 3)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 200)
                    .fill(Color(hex: "#000").opacity(0.03))
            )
            .padding(.horizontal, 16)
            
            Spacer()
            
            // currency select tabs
            HStack {
                Text("USD")
                    .padding(.vertical, 3)
                    .padding(.horizontal)
                    .font(.custom("Helvetica Neue", size: 14))
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(200)
                    .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 4)
                    .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 1)
                Text("GBP")
                    .font(.custom("Helvetica Neue", size: 14))
                    .frame(maxWidth: .infinity)
                Text("CAD")
                    .font(.custom("Helvetica Neue", size: 14))
                    .frame(maxWidth: .infinity)
                Text("EUR")
                    .font(.custom("Helvetica Neue", size: 14))
                    .frame(maxWidth: .infinity)
                Text("AUD")
                    .font(.custom("Helvetica Neue", size: 14))
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 29)
            .background(
                RoundedRectangle(cornerRadius: 200)
                    .fill(Color(hex: "#000").opacity(0.03))
            )
            .padding(.horizontal, 24)
            .padding(.bottom, 36)
            
            // input text field
            TextField("Amount to convert", text: $amountToConvert)
                        .font(.custom("Helvetica Neue", size: 13))
                        .frame(height: 56)
                        .frame(maxWidth: 216)
                        .padding(.leading)
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 1.5)
                        )
                        .padding(.bottom, 24)

                        
            Spacer()
            
            // is approx text
            Text("is approximately")
                .font(.custom("Helvetica Neue", size: 32))
                .fontWeight(.medium)
            
            // results output
            Text("5,900")
                .font(.custom("Helvetica Neue", size: 64))
                .fontWeight(.medium)
            
            // currency text
            Text("JPY")
                .font(.custom("Helvetica Neue", size: 32))
                .fontWeight(.medium)
            
            Spacer()
            
            // convert btn
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
            
            // info btn
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
