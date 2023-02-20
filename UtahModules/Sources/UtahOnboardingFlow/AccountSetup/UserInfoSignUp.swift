//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
import Account
import CardinalKit
import Firebase
import FirebaseFirestore
import Onboarding
import SwiftUI
import UtahSharedContext

struct UserInfoSignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var disease = "I Don't Know"
    @State private var isEditing = false
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I Don't Know"]
    
    @State private var usernamePasswordValid = false

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            VStack {
                Form {
                    usernamePasswordSection
                    nameSection
                    diseaseSection
                }
                button
            }.navigationTitle("Sign Up")
        }
    }
    
    @ViewBuilder
    private var usernamePasswordSection: some View {
        Section(header: Text("Account")) {
            Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                UsernamePasswordFields(
                    username: $email,
                    password: $password,
                    valid: $usernamePasswordValid
                )
            }
        }.padding(.vertical, 4)
    }
    
    @ViewBuilder
    private var button: some View {
        Button(action: {
            /* WILL DO IN NEXT COMMIT
             if let user = Auth.auth().currentUser {
                let data: [String: String] = ["firstName": firstName, "lastName": lastName, "disease": disease, "email": user.email ?? ""]
                Firestore.firestore().collection("users").document(user.uid).setData(data)
            }*/
        }) {
            Text("Next")
                .frame(maxWidth: .infinity, minHeight: 38)
        }
        .padding(.horizontal, 36)
        .padding(.bottom, 16)
        .buttonStyle(.borderedProminent)
    }
    
    @ViewBuilder
    private var nameSection: some View {
        Section(header: Text("Name")) {
            Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                GridRow {
                    Text("First Name")
                        .fontWeight(.semibold)
                        .gridColumnAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    TextField("First Name", text: $firstName)
                        .frame(maxWidth: .infinity)
                        .autocorrectionDisabled(true)
                }
                Divider()
                GridRow {
                    Text("Last Name")
                        .fontWeight(.semibold)
                        .gridColumnAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    TextField("Last Name", text: $lastName)
                        .frame(maxWidth: .infinity)
                        .autocorrectionDisabled(true)
                }
            }
        }.padding(.vertical, 4)
    }
    
    @ViewBuilder
    private var diseaseSection: some View {
        Section(header: Text("Disease")) {
            Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                Picker("Select your Disease", selection: $disease) {
                    ForEach(diseaseOptions, id: \.self) { option in
                        Text(option)
                    }
                }.fontWeight(.semibold)
            }
        }.padding(.vertical, 1)
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoSignUp()
            .environmentObject(Account(accountServices: []))
    }
}
