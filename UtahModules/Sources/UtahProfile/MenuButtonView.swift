//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/27/23.
//

import SwiftUI

struct MenuButton: View {
    @Binding var eventBool: Bool
    var buttonLabel: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Button(action: {
            eventBool = true
        }) {
            if foregroundColor == .accentColor {
                Text(buttonLabel)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .cornerRadius(10)
                    .font(.headline)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.accentColor, lineWidth: 2)
                    )
            } else {
                Text(buttonLabel)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .cornerRadius(10)
                    .font(.headline)
            }
        }
        .padding(.bottom, 30)
    }
}
