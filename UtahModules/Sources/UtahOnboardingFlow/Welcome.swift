//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import Onboarding
import SwiftUI
import UtahSharedContext


struct Welcome: View {
    @Binding private var onboardingSteps: [OnboardingFlow.Step]
    
    
    var body: some View {
        OnboardingView(
            title: "Welcome to U-STEP".moduleLocalized,
            subtitle: "A collaboration between Stanford University & University of Utah".moduleLocalized,
            areas: [
                .init(
                    icon: Image(systemName: "apps.iphone"),
                    title: "Report your health outcomes".moduleLocalized,
                    description: "Fill out surveys about your health".moduleLocalized
                ),
                .init(
                    icon: Image(systemName: "figure.walk"),
                    title: "Track your health".moduleLocalized,
                    description: "Record your daily activity levels".moduleLocalized
                ),
                .init(
                    icon: Image(systemName: "cross.circle.fill"),
                    title: "Monitor your progress".moduleLocalized,
                    description: "View your progression over time\n".moduleLocalized
                )
            ],
            actionText: "Next".moduleLocalized,
            action: {
                if !FeatureFlags.disableFirebase {
                    onboardingSteps.append(.accountSetup)
                } else {
                    onboardingSteps.append(.consent)
                }
            }
        )
        .font(.system(size: 31))
    }
    
    
    init(onboardingSteps: Binding<[OnboardingFlow.Step]>) {
        self._onboardingSteps = onboardingSteps
    }
}


struct Welcome_Previews: PreviewProvider {
    @State private static var path: [OnboardingFlow.Step] = []
    
    
    static var previews: some View {
        Welcome(onboardingSteps: $path)
    }
}
