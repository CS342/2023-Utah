//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/27/23.
//

import SwiftUI

struct EditButton: View {
    @State private var isEditing = false
    @Binding var disease: String 
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isEditing = true
            }, label: {
                Text("Edit")
                    .foregroundColor(.accentColor)
                    .font(.headline)
                    .fontWeight(.medium)
            })
                .sheet(isPresented: $isEditing) {
                    FormView(disease: $disease, isEditing: $isEditing)
                }
        }
    }
}
