//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import FHIR
import Foundation
import Scheduler


/// A `Scheduler` using the `FHIR` standard as well as the ``UtahTaskContext`` to schedule and manage tasks and events in the
/// CardinalKit Utah Applciation.
public typealias UtahScheduler = Scheduler<FHIR, UtahTaskContext>


extension UtahScheduler {
    /// Creates a default instance of the ``UtahScheduler`` by scheduling the tasks listed below.
    public convenience init() {
        self.init(
            tasks: [
                Task(
                    title: String(localized: "TASK_SOCIAL_SUPPORT_QUESTIONNAIRE_TITLE", bundle: .module),
                    description: String(localized: "TASK_SOCIAL_SUPPORT_QUESTIONNAIRE_DESCRIPTION", bundle: .module),
                    schedule: Schedule(
                        start: Calendar.current.startOfDay(for: Date()),
                        dateComponents: .init(hour: 0, minute: 30), // Every Day at 12:30 AM
                        end: .numberOfEvents(356)
                    ),
                    context: UtahTaskContext.questionnaire(Bundle.module.questionnaire(withName: "EdmontonFrailScale"))
                )
            ]
        )
    }
}
