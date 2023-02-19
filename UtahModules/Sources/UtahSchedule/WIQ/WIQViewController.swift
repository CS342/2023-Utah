//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import ResearchKit
import UIKit

struct WIQViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> WIQViewCoordinator {
        WIQViewCoordinator()
    }
    
    func updateUIViewController(_ taskViewController: ORKTaskViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleSurveyTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            let instruction = ORKInstructionStep(identifier: "WIQ")
                    instruction.title = "Walking Impairment Questionnaire"
                    instruction.text = "Patient Mobility Assessment"
                    
                    steps += [instruction]
                
                    let wiqChoices = [
                        ORKTextChoice(text: "No Difficulty", value: 0 as NSNumber),
                        ORKTextChoice(text: "Slight Difficulty", value: 1 as NSNumber),
                        ORKTextChoice(text: "Some Difficulty", value: 2 as NSNumber),
                        ORKTextChoice(text: "Much Difficulty", value: 3 as NSNumber),
                        ORKTextChoice(text: "Unable to Do", value: 4 as NSNumber)
                    ]
                    
                    let wiqAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: wiqChoices)
            
                    // Q1
                    let wiq1 = ORKQuestionStep(
                        identifier: "WIQ Endurance 1",
                        title: "How difficult was it for you to:",
                        question: "Walk indoors, such as around your home?",
                        answer: wiqAnswerFormat
                    )
                    wiq1.isOptional = false
            
                    // Q2
                    let wiq2 = ORKQuestionStep(
                        identifier: "WIQ Endurance 2",
                        title: "How difficult was it for you to:",
                        question: "Walk 50 feet?",
                        answer: wiqAnswerFormat
                    )
                    wiq2.isOptional = false
            
                    // Q3
                    let wiq3 = ORKQuestionStep(
                        identifier: "WIQ Endurance 3",
                        title: "How difficult was it for you to:",
                        question: "Walk 150 feet? (1/2 block)",
                        answer: wiqAnswerFormat
                    )
                    wiq3.isOptional = false
            
                    // Q4
                    let wiq4 = ORKQuestionStep(
                        identifier: "WIQ Endurance 4",
                        title: "How difficult was it for you to:",
                        question: "Walk 300 feet? 1 block?",
                        answer: wiqAnswerFormat
                    )
                    wiq4.isOptional = false
            
                    // Q5
                    let wiq5 = ORKQuestionStep(
                        identifier: "WIQ Endurance 5",
                        title: "How difficult was it for you to:",
                        question: "Walk 600 feet? 2 blocks?",
                        answer: wiqAnswerFormat
                    )
                    wiq5.isOptional = false
            
                    // Q6
                    let wiq6 = ORKQuestionStep(
                        identifier: "WIQ Endurance 6",
                        title: "How difficult was it for you to:",
                        question: "Walk 900 feet? 3 blocks?",
                        answer: wiqAnswerFormat
                    )
                    wiq6.isOptional = false
            
                    // Q7
                    let wiq7 = ORKQuestionStep(
                        identifier: "WIQ Endurance 7",
                        title: "How difficult was it for you to:",
                        question: "Walk 1500 feet? 5 blocks?",
                        answer: wiqAnswerFormat
                    )
                    wiq7.isOptional = false
                    
                    steps += [wiq1, wiq2, wiq3, wiq4, wiq5, wiq6, wiq7]
                    
                    // SUMMARY
                    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
                    summaryStep.title = "Thank you."
                    summaryStep.text = "We appreciate your time."
                    steps += [summaryStep]
                    
                    return ORKOrderedTask(identifier: "WIQ", steps: steps)
        }()
        
        let taskViewController = ORKTaskViewController(task: sampleSurveyTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        
        // & present the VC!
        return taskViewController
    }
    
}
