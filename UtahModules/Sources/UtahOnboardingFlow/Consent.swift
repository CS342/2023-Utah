//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import Onboarding
import SwiftUI


struct Consent: View {
    @Binding private var onboardingSteps: [OnboardingFlow.Step]
    
    
    private var consentDocument: Data {
        guard let path = Bundle.module.url(forResource: "ConsentDocument", withExtension: "md"),
              let data = try? Data(contentsOf: path) else {
            return Data("CONSENT_LOADING_ERROR".moduleLocalized.utf8)
        }
        return data
    }
    
    var body: some View {
        ConsentView(
            header: {
                OnboardingTitleView(
                    title: "Consent".moduleLocalized,
                    subtitle: "VascuTrack is asking to collect and analyze your healthcare information".moduleLocalized
                )
            },
            asyncMarkdown: {
                consentDocument
            },
            action: {
                onboardingSteps.append(.conditionQuestion)
            }
        )
    }
    
    
    init(onboardingSteps: Binding<[OnboardingFlow.Step]>) {
        self._onboardingSteps = onboardingSteps
    }
}


struct Consent_Previews: PreviewProvider {
    @State private static var path: [OnboardingFlow.Step] = []
    
    
    static var previews: some View {
        Consent(onboardingSteps: $path)
    }
}
