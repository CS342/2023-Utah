//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import FirebaseAuth
import SwiftUI
import UtahSharedContext

struct LogoutButton: View {
    @Binding var eventBool: Bool
    var buttonLabel: String
    var foregroundColor: Color
    var backgroundColor: Color
    @AppStorage(StorageKeys.onboardingFlowComplete) var completedOnboardingFlow = true
    
    var body: some View {
        Button(action: {
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
            }
            eventBool = true
            completedOnboardingFlow = false
        }) {
            Text(buttonLabel)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
                .font(.system(size: 25))
        }
        .padding(.bottom, 30)
    }
}
