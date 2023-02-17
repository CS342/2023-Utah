//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI

struct InformationView: View {
    @State private var email = "jane@example.com"
    @State private var disease = "Peripheral Arterial Disease"
    @State private var isEditing = false
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I'm not sure"]
    
    var body: some View {
        VStack {
            Text("Email")
                .font(.headline)
            Text(email)
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 20)
            Divider()
                .padding(.bottom, 20)
            Text("Disease")
                .font(.headline)
            Text(disease)
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 20)
            Divider()
                .padding(.bottom, 20)
            Button(action: {
                isEditing = true
            }) {
                Text("Edit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
                    .padding(.horizontal, 30)
            }
            .padding(.bottom, 30)
            .sheet(isPresented: $isEditing) {
                Form {
                    Section(header: Text("Email")) {
                        TextField("Enter your email", text: $email)
                            .font(.subheadline)
                            .padding(.vertical, 10)
                    }
                    Section(header: Text("Disease")) {
                        Picker("Select your disease", selection: $disease) {
                            ForEach(diseaseOptions, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                    Button(action: {
                        isEditing = false
                    }) {
                        Text("Save")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.headline)
                            .padding(.horizontal, 30)
                    }
                }
            }
        }
        .padding(.horizontal, 30)
    }
}


struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
