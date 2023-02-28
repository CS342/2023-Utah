//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/27/23.
//

import SwiftUI

struct InfoRow: View {
    var field: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text(field)
                .font(.subheadline)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.bottom, 5)
        
        HStack {
            Text(value)
                .font(.subheadline)
            Spacer()
        }
        Divider()
            .padding(.bottom, 20)
    }
}
