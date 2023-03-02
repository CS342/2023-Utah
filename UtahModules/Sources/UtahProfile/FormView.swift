//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct FormView: View {
    @Binding var disease: String
    @Binding var isEditing: Bool
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I'm not sure"]
    var body: some View {
        Form {
            Section(header: Text("Condition").font(.system(size: 20))) {
                Picker("Select your condition", selection: $disease) {
                    ForEach(diseaseOptions, id: \.self) { option in
                        Text(option)
                    }
                }
                .font(.system(size: 20))
                .padding(.vertical, 10)
            }
            Button(action: {
                isEditing = false
                if let user = Auth.auth().currentUser {
                    Firestore.firestore().collection("users").document(user.uid).updateData(["disease": disease]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        }
                    }
               }
            }) {
                HStack {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 25))
                    Spacer()
                }
            }
        }
        .navigationTitle(Text("Setting"))
    }
}
