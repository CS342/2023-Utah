//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import Onboarding
import SwiftUI


struct ConditionQuestionaire: View {
    @Binding private var onboardingSteps: [OnboardingFlow.Step]
    
    
    var body: some View {
        SequentialOnboardingView(
            title: "What condition do you have?".moduleLocalized,
            subtitle: "Select your choice".moduleLocalized,
            content: [
                .init(
                    title: "Track your health".moduleLocalized,
                    description: "Easily see your biometric data".moduleLocalized
                ),
                .init(
                    title: "Report your outcomes".moduleLocalized,
                    description: "Fill out surveys about your health".moduleLocalized
                ),
                .init(
                    title: "Streamline your care".moduleLocalized,
                    description: "Help your doctors help you get better".moduleLocalized
                )
            ],
            actionText: "INTERESTING_MODULES_BUTTON".moduleLocalized,
            action: {
                #if targetEnvironment(simulator) && (arch(i386) || arch(x86_64))
                print("PKCanvas view-related views are currently skipped on Intel-based iOS simulators due to a metal bug on the simulator.")
                onboardingSteps.append(.healthKitPermissions)
                #else
                onboardingSteps.append(.consent)
                #endif
            }
        )
    }
    
    
    init(onboardingSteps: Binding<[OnboardingFlow.Step]>) {
        self._onboardingSteps = onboardingSteps
    }
}


struct ConditionQuestionaire_Previews: PreviewProvider {
    @State private static var path: [OnboardingFlow.Step] = []
    
    
    static var previews: some View {
        ConditionQuestionaire(onboardingSteps: $path)
    }
}
