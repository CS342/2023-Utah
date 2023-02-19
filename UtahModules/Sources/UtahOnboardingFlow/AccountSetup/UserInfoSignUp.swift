//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
import Firebase
import FirebaseFirestore
import SwiftUI

struct UserInfoSignUp: View {
    @State private var firstName = "First Name"
    @State private var lastName = "Last Name"
    @State private var disease = "I Don't Know"
    @State private var isEditing = false
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I Don't Know"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                VStack {
                    Form {
                        Section(header: Text("Name")) {
                            TextField("First Name", text: $firstName)
                            TextField("Last Name", text: $lastName)
                        }
                        .font(.subheadline)
                        .padding(.vertical, 10)
                        Section(header: Text("Disease")) {
                            Picker("Select your Disease", selection: $disease) {
                                ForEach(diseaseOptions, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            .padding(.vertical, 10)
                        }
                    }
                    Button(action: {
                        if let user = Auth.auth().currentUser {
                            let data: [String: String] = ["firstName": firstName, "lastName": lastName, "disease": disease, "email": user.email ?? ""]
                            Firestore.firestore().collection("users").document(user.uid).setData(data)
                        }
                    }) {
                        Text("Next")
                            .frame(maxWidth: .infinity, minHeight: 38)
                    }
                    .padding(.horizontal, 36)
                    .padding(.bottom, 16)
                    .buttonStyle(.borderedProminent)
                    .navigationTitle("More Information")
                }
            }
        }
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoSignUp()
    }
}
