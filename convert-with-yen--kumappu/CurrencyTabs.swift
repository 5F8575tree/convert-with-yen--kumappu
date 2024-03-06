//
//  CurrencyTabs.swift
//  convert-with-yen--kumappu
//
//  Created by Mark J Rawlins on 2024/03/06.
//

import SwiftUI

struct CurrencyTabs: View {
    @Binding var activeTab: CurrencyTab
    @Namespace private var namespace
    
    let tabWidth: CGFloat = 68

    var body: some View {
        HStack(spacing: 0) {
            ForEach(CurrencyTab.allCases, id: \.self) { tab in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        activeTab = tab
                    }
                }) {
                    Text(tab.rawValue)
                        .padding(.vertical, 3)
                        .frame(width: tabWidth, height: 23)
                        .font(.custom("Helvetica Neue", size: 14))
                        .foregroundColor(activeTab == tab ? .black : .gray)
                        .background(
                            ZStack {
                                if activeTab == tab {
                                    RoundedRectangle(cornerRadius: 200)
                                        .fill(Color.white)
                                        .matchedGeometryEffect(id: "activeBackground", in: namespace)
                                        .shadow(color: Color.black.opacity(0.12), radius: 12, x: 0, y: 4)
                                        .shadow(color: Color.black.opacity(0.12), radius: 4, x: 0, y: 1)
                                }
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 200)
                                .stroke(Color.black, lineWidth: activeTab == tab ? 1 : 0)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 29)
        .background(
            RoundedRectangle(cornerRadius: 200)
                .fill(Color(hex: "#000").opacity(0.03))
        )
        .padding(.horizontal, 24)
        .padding(.bottom, 36)
    }
}

#Preview {
    CurrencyTabs(activeTab: .constant(.usd))
}
