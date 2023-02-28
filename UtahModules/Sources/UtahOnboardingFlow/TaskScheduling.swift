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
import UtahSchedule


struct TaskScheduling: View {
    @AppStorage(StorageKeys.onboardingFlowComplete) var completedOnboardingFlow = false
    @EnvironmentObject var scheduler: UtahScheduler


    var body: some View {
        OnboardingView(
            contentView: {
                VStack {
                    OnboardingTitleView(
                        title: "Task Scheduling",
                        subtitle: "You will be asked to complete a task once every month, starting today."
                    )
                    Spacer()
                    Image(systemName: "heart.text.square.fill")
                        .font(.system(size: 150))
                        .foregroundColor(.accentColor)
                    Text("The task will take approximately 10 minutes to complete.")
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 16)
                    Spacer()
                }
            }, actionView: {
                OnboardingActionsView(
                    "Continue",
                    action: {
                        // Schedule the edmonton task starting today
                        // for the next 12 months

                        // Get the day from today's date, which is the same day
                        // we want to repeat the task on every month.
                        let dayOfMonth = Calendar.current.dateComponents([.day], from: Date())

                        // Create the task to schedule
                        let task = Task(
                            title: String(
                                localized: "RESEARCHKIT_TASK_TITLE",
                                bundle: .module
                            ),
                            description: String(
                                localized: "RESEARCHKIT_TASK_DESCRIPTION",
                                bundle: .module
                            ),
                            schedule: Schedule(
                                start: Calendar.current.startOfDay(for: Date()),
                                dateComponents: dayOfMonth,
                                end: .numberOfEvents(12)
                            ),
                            context: UtahTaskContext.researchKitTask(.edmonton)
                        )

                        // Schedule the task using the CardinalKit Scheduler
                        scheduler.schedule(task: task)

                        // Onboarding is now complete
                        completedOnboardingFlow = true
                    }
                )
            }
        )
    }
}


struct TaskScheduling_Previews: PreviewProvider {
    static var previews: some View {
        TaskScheduling()
    }
}

