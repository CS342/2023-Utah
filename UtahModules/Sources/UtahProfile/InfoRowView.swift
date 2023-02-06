//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/6/23.
//

import SwiftUI

struct InfoRowView: View {
    
    var title: String
    var value: String
    var image: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3) {
                Label(value, systemImage: image)
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

