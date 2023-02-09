//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
//
//import Onboarding
//import SwiftUI
//

//struct InterestingModules: View {
//    @Binding private var onboardingSteps: [OnboardingFlow.Step]
//
//
//    var body: some View {
//        SequentialOnboardingView(
//            title: "What condition do you have?".moduleLocalized,
//            subtitle: "".moduleLocalized,
//            content: [
//                .init(
//                    title: "Arterial Disease".moduleLocalized,
//                    description: "Easily see your biometric data".moduleLocalized
//                ),
//                .init(
//                    title: "Report your outcomes".moduleLocalized,
//                    description: "Fill out surveys about your health".moduleLocalized
//                )
//            ],
//            actionText: "Next".moduleLocalized,
//            action: {
//                #if targetEnvironment(simulator) && (arch(i386) || arch(x86_64))
//                print("PKCanvas view-related views are currently skipped on Intel-based iOS simulators due to a metal bug on the simulator.")
//                onboardingSteps.append(.healthKitPermissions)
//                #else
//                onboardingSteps.append(.consent)
//                #endif
//            }
//        )
//    }
//
//
//    init(onboardingSteps: Binding<[OnboardingFlow.Step]>) {
//        self._onboardingSteps = onboardingSteps
//    }
//}
//
//
//struct ThingsToKnow_Previews: PreviewProvider {
//    @State private static var path: [OnboardingFlow.Step] = []
//
//
//    static var previews: some View {
//        InterestingModules(onboardingSteps: $path)
//    }
//}

//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import FHIR
import HealthKitDataSource
import Onboarding
import SwiftUI
import UtahSharedContext


struct InterestingModules: View {
    @Binding var onboardingSteps: [OnboardingFlow.Step]
    @State private var selection = "Arterial Disease"
    let conditions = ["Arterial Disease", "Venous Disease"]
    
    var body: some View {
        OnboardingView(
            contentView: {
                VStack {
                    OnboardingTitleView(
                        title: "What condition do you have?".moduleLocalized,
                        subtitle: "".moduleLocalized
                    )
                    Picker("Select a condition", selection: $selection) {
                        ForEach(conditions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    Text("Selected: \(selection)")
                    Spacer()
                }
            }, actionView: {
                OnboardingActionsView(
                    "Next".moduleLocalized,
                    action: {
                        onboardingSteps.append(.consent)
                    }
                )
            }
        )
    }
}


struct ThingsToKnow_Previews: PreviewProvider {
    @State private static var path: [OnboardingFlow.Step] = []
    
    static var previews: some View {
        InterestingModules(onboardingSteps: $path)
    }
}
