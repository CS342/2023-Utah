//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
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
