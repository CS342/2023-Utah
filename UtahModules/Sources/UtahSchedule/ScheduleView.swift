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
    @State private var showingSurvey = false
    @State private var showingSurvey2 = false
    
    var startOfDays: [Date] {
        Array(eventContextsByDate.keys)
    }
    
    public var body: some View {
        NavigationStack {
            ZStack {
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
                VStack{
                    Button("Edmonton Frail Scale"){
                        showingSurvey.toggle()
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .background(.red)
                    .cornerRadius(10)
                    .sheet(isPresented: $showingSurvey){
                        EdmontonViewController()
                    }
                    Button("Walking Impairement Questionnaire"){
                        showingSurvey2.toggle()
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                    .sheet(isPresented: $showingSurvey2){
                        WIQViewController()
                    }
                    NavigationLink(destination: GetUpAndGo()) {
                        Text("Get Up And Go Question")
                    }.frame(alignment: .topLeading)
                        .padding(.all, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.white, lineWidth: 2)
                        )
                        .background(Color(.white))
                        .cornerRadius(25)
                        .navigationTitle(String(localized: "QUESTIONNAIRE_LIST_TITLE", bundle: .module))
                }
            }
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

#if DEBUG
struct SchedulerView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
            .environmentObject(
                UtahScheduler()
            )
    }
}
#endif
