//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import Account
import class FHIR.FHIR
import FirebaseAccount
import FirebaseAuth
import FirebaseFirestore
import Onboarding

struct UserInformationView: View {
    let user = Auth.auth().currentUser
    @State private var needHelp = false
    @State private var logOut = false
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I'm not sure"]
    
    var body: some View {
        VStack {
            Text(firestoreManager.disease)
            InfoRow(field: "EMAIL", value: user?.email ?? "")
            InfoRow(field: "CONDITION", value: firestoreManager.disease)
            Spacer()
            MenuButton(eventBool: $needHelp, buttonLabel: "Need help?", foregroundColor: Color.accentColor, backgroundColor: Color(.white))
                .sheet(isPresented: $needHelp) {
                    HelpPage()
                }
                .padding(.bottom, -15)
            MenuButton(eventBool: $logOut, buttonLabel: "Logout", foregroundColor: Color(.white), backgroundColor: Color.accentColor)
                .sheet(isPresented: $needHelp) {
                    FormView(disease: $firestoreManager.disease, isEditing: $needHelp)
                }
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 20)
    }
}
