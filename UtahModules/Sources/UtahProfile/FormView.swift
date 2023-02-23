//
//  SwiftUIView.swift
//  
//
//  Created by Jiahui Chen  on 2/22/23.
//

import SwiftUI

struct FormView: View {
    @Binding var email: String
    @Binding var disease: String
    @Binding var isEditing: Bool
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I'm not sure"]
    var body: some View {
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
            Section(header: Text("Profile Picture")) {
                EditPhotoView()
                    .frame(maxWidth: .infinity)
            }
            Button(action: {
                isEditing = false
            }) {
                HStack{
                    Spacer()
                    Text("Save")
                    Spacer()
                }
            }
        }
        .navigationTitle(Text("Setting"))
    }
}


