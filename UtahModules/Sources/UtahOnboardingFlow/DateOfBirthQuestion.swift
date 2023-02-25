//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import FHIR
import FirebaseAuth
import FirebaseFirestore
import HealthKitDataSource
import Onboarding
import SwiftUI
import UtahSharedContext


struct DateOfBirthQuestion: View {
    @Binding var onboardingSteps: [OnboardingFlow.Step]
    @State private var date = Date.now
    
    var body: some View {
        OnboardingView(
            contentView: {
                VStack {
                    OnboardingTitleView(
                        title: "What is your Date of Birth?".moduleLocalized,
                        subtitle: "".moduleLocalized
                    )
                    DateOfBirthPicker(date: $date)
                    Spacer()
                }
            }, actionView: {
                OnboardingActionsView(
                    "Next".moduleLocalized,
                    action: {
                        if let user = Auth.auth().currentUser {
                            Firestore.firestore().collection("users").document(user.uid).updateData(["dateOfBirth": date]) { err in
                                if let err = err {
                                    print("Error updating document: \(err)")
                                } else {
                                    onboardingSteps.append(.conditionQuestion)
                                }
                            }
                       }
                    }
                )
            }
        )
    }
}


struct DateOfBirth_Previews: PreviewProvider {
    @State private static var path: [OnboardingFlow.Step] = []
    
    static var previews: some View {
        DateOfBirthQuestion(onboardingSteps: $path)
    }
}
