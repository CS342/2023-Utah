//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/27/23.
//

import SwiftUI

struct ProfileText: View {
    @AppStorage("name") var name = "Jiahui Chen"
    @AppStorage("subtitle") var subtitle = "Patient at University of Utah Hospital"

    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(name)
                    .bold()
                    .font(.title)
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
                .padding()
        }
    }
}
