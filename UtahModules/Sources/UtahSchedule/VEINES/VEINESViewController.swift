//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

// swiftlint:disable function_body_length
// swiftlint:disable closure_body_length
// swiftlint:disable line_length

import ResearchKit
import SwiftUI
import UIKit

struct VEINESViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> VEINESViewCoordinator {
        VEINESViewCoordinator()
    }
    
    func updateUIViewController(_ taskViewController: ORKTaskViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let wiqSurveyTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            let instruction = ORKInstructionStep(identifier: "VEINES")
                    instruction.title = "VEINES-QOL/Sym Questionnaire"
                    instruction.text = """
                        This information will help your doctors keep track of how you feel and how well you are able to do your usual activities. If you are unsure about how to answer a question, please give the best answer you can.
                        
                        You will be asked to complete this questionnaire at regular intervals to track your progress over time. You will be able to view your progress in the trends tab.

                        """
                    
                    steps += [instruction]

                    // Question 2
                    let q2Choices = [
                        ORKTextChoice(text: "On walking", value: "1" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "At mid-day", value: "2" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "At the end of the day", value: "3" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "During the night", value: "4" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "At any time of the day", value: "5" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "Never", value: "6" as NSSecureCoding & NSCopying & NSObjectProtocol)
                    ]
                    
                    let q2AnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q2Choices)
                    let q2Step = ORKQuestionStep(
                        identifier: "q2",
                        title: "",
                        question: """
                            At what time of the day is your leg problem most instense?
                            """,
                        answer: q2AnswerFormat
                    )
                    q2Step.isOptional = false
                    
                    steps += [q2Step]
            
                    // Question 3
                    let q3Choices = [
                        ORKTextChoice(text: "Much better now than one year ago", value: "1" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "Somewhat better now than one year ago", value: "2" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "About the same now as one year ago", value: "3" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "Somewhat worse now than one year ago", value: "4" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "Much worse now than one year ago", value: "5" as NSSecureCoding & NSCopying & NSObjectProtocol),
                        ORKTextChoice(text: "I did not have any leg problem last year", value: "6" as NSSecureCoding & NSCopying & NSObjectProtocol)
                    ]
                    
                    let q3AnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q3Choices)
                    let q3Step = ORKQuestionStep(
                        identifier: "q3",
                        title: "",
                        question: """
                            Compared to one year ago, how would you rate your leg problem in general now?
                            """,
                        answer: q3AnswerFormat
                    )
                    q3Step.isOptional = false
                    
                    steps += [q3Step]
                    
                    // SUMMARY
                    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
                    summaryStep.title = "Thank you."
                    summaryStep.text = "You can view your progress in the trends tab."
                    steps += [summaryStep]
                    
                    return ORKOrderedTask(identifier: "veines", steps: steps)
        }()
        
        let taskViewController = ORKTaskViewController(task: wiqSurveyTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        
        // & present the VC!
        return taskViewController
    }
}
