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
    var value: String
    
    var body: some View {
        HStack {
            Text(field)
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.bottom, 5)
        
        HStack {
            Text(value)
                .font(.body)
            Spacer()
        }
        Divider()
            .padding(.bottom, 20)
    }
}

struct MenuButton: View {
    @Binding var eventBool: Bool
    var buttonLabel: String
    var foregroundColor: Color
    var backgroundColor: Color
    var body: some View {
        Button(action: {
            eventBool = true
        }) {
            Text(buttonLabel)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
                .font(.headline)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 2)
                )
        }
        .padding(.bottom, 30)
    }
}

struct UserInformationView: View {
    @State private var email = "jane@example.com"
    @State private var disease = "Peripheral Arterial Disease"
    @State private var needHelp = false
    @State private var logOut = false
    let diseaseOptions = ["Peripheral Arterial Disease", "Venous Insufficiency", "I'm not sure"]

    var body: some View {
        VStack {
            InfoRow(field: "EMAIL", value: email)
            InfoRow(field: "CONDITION", value: disease)
            MenuButton(eventBool: $needHelp, buttonLabel: "Need help?", foregroundColor: Color.accentColor, backgroundColor: Color(.white))
                .sheet(isPresented: $needHelp) {
                    FormView(email: $email, disease: $disease, isEditing: $needHelp)
                }
            MenuButton(eventBool: $logOut, buttonLabel: "Logout", foregroundColor: Color(.white), backgroundColor: Color.accentColor)
                .sheet(isPresented: $needHelp) {
                    FormView(email: $email, disease: $disease, isEditing: $needHelp)
                }
        }
        .padding(.horizontal, 30)
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView()
    }
}
