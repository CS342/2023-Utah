//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//


import Questionnaires
import Scheduler
import SwiftUI


public struct ScheduleView: View {
    @EnvironmentObject var scheduler: UtahScheduler
    @State var eventContextsByDate: [Date: [EventContext]] = [:]
    @State var presentedContext: EventContext?
    
    
    var startOfDays: [Date] {
        Array(eventContextsByDate.keys)
    }
    
    
    public var body: some View {
        NavigationStack {
            List(startOfDays, id: \.timeIntervalSinceNow) { startOfDay in
                Section(format(startOfDay: startOfDay)) {
                    ForEach(eventContextsByDate[startOfDay] ?? [], id: \.event) { eventContext in
                        EventContextView(eventContext: eventContext)
                            .onTapGesture {
                                if !eventContext.event.complete {
                                    presentedContext = eventContext
                                }
                            }
                    }
                }
            }
                .onChange(of: scheduler) { _ in
                    calculateEventContextsByDate()
                }
                .task {
                    calculateEventContextsByDate()
                }
                .sheet(item: $presentedContext) { presentedContext in
                    destination(withContext: presentedContext)
                }
                .navigationTitle(String(localized: "QUESTIONNAIRE_LIST_TITLE", bundle: .module))
        }
    }
    
    
    public init() {}
    
    
    private func destination(withContext eventContext: EventContext) -> some View {
        @ViewBuilder
        var destination: some View {
            switch eventContext.task.context {
            case let .questionnaire(questionnaire):
                QuestionnaireView(questionnaire: questionnaire) { _ in
                    _Concurrency.Task {
                        await eventContext.event.complete(true)
                    }
                }
            }
        }
        return destination
    }
    
    
    private func format(startOfDay: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: startOfDay)
    }
    
    private func calculateEventContextsByDate() {
        let eventContexts = scheduler.tasks.flatMap { task in
            task
                .events(
                    from: Calendar.current.startOfDay(for: .now),
                    to: .numberOfEventsOrEndDate(100, .now)
                )
                .map { event in
                    EventContext(event: event, task: task)
                }
        }
            .sorted()
        
        let newEventContextsByDate = Dictionary(grouping: eventContexts) { eventContext in
            Calendar.current.startOfDay(for: eventContext.event.scheduledAt)
        }
        
        if newEventContextsByDate != eventContextsByDate {
            eventContextsByDate = newEventContextsByDate
        }
    }
}

// This just removes this section from being counted in our % "test coverage"
#if !TESTING

struct SchedulerView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            .environmentObject(
                UtahScheduler(
                    tasks: [
                        Task(
                            title: String(localized: "QUESTIONNAIRE_TITLE"),
                            description: String(localized: "QUESTIONNAIRE_DESCRIPTION"),
                            schedule: Schedule(
                                start: Calendar.current.startOfDay(for: Date()),
                                dateComponents: .init(hour: 0, minute: 30), // Every Day at 12:30 AM
                                end: .numberOfEvents(356)
                            ),
                            context: UtahTaskContext.questionnaire(Bundle.main.questionnaire(withName: "EdmontonFrailScale"))
                        )
                    ]
                )
            )
    }
}

#endif
