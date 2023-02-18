//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI
import UIKit
import ResearchKit

struct EdmontonViewController: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> EdmontonViewCoordinator {
        EdmontonViewCoordinator()
    }
    
    func updateUIViewController(_ taskViewController: ORKTaskViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {

        let sampleSurveyTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            // Instruction step
            let instructionStep = ORKInstructionStep(identifier: "IntroStep")
            instructionStep.title = "Patient Questionnaire"
            instructionStep.text = "This information will help your doctors keep track of how you feel and how well you are able to do your usual activities. If you are unsure about how to answer a question, please give the best answer you can and make a written comment beside your answer."
            
            steps += [instructionStep]
            
            // Clock test step
            let clockTestInstructionStep = ORKInstructionStep(identifier: "ClockStep")
            clockTestInstructionStep.title = "Draw a clock"
            clockTestInstructionStep.text = "Place numbers the correct positions on a pre-drawn circle, and place hands to indicate the time of ‘ten after eleven’. Upload a photo in the next step"
            
            steps += [clockTestInstructionStep]
            
            // Image capture step
            
            let imageCaptureStep = ORKImageCaptureStep(identifier: "ImageCaptureStep") // we should add a circle template image here
            
            steps += [imageCaptureStep]
            
//            //In general, would you say your health is:
//            let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
//            let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Question #1", question: "In general, would you say your health is:", answer: healthScaleAnswerFormat)
//
//            steps += [healthScaleQuestionStep]
            
            // Question 2
            let q2Choices = [
                ORKTextChoice(text: "0", value: 0 as NSNumber),
                ORKTextChoice(text: "1-2", value: 1 as NSNumber),
                ORKTextChoice(text: ">2", value: 2 as NSNumber)
            ]
            let q2ChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q2Choices)
            let q2Step = ORKQuestionStep(identifier: "q2", title: "", question: "In the past year, how many times have you been admitted to a hospital?", answer: q2ChoiceAnswerFormat)
            q2Step.isOptional = false
            
            steps += [q2Step]
            
            // Question 3
            let q3Choices = [
                ORKTextChoice(text: "Excellent", value: 0 as NSNumber),
                ORKTextChoice(text: "Very Good", value: 0 as NSNumber),
                ORKTextChoice(text: "Good", value: 0 as NSNumber),
                ORKTextChoice(text: "Fair", value: 1 as NSNumber),
                ORKTextChoice(text: "Poor", value: 2 as NSNumber)
            ]
            let q3ChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q3Choices)
            let q3Step = ORKQuestionStep(identifier: "q3", title: "", question: "In general, how would you describe your health?", answer: q3ChoiceAnswerFormat)
            q3Step.isOptional = false
            
            steps += [q3Step]
            
            // Question 4
            let q4Choices = [
                ORKTextChoice(text: "0-1", value: 0 as NSNumber),
                ORKTextChoice(text: "2-4", value: 1 as NSNumber),
                ORKTextChoice(text: "5-8", value: 2 as NSNumber)
            ]
            let q4ChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q4Choices)
            let q4Step = ORKQuestionStep(identifier: "q4", title: "", question: "With how many of the following activities do you require help? (meal preparation, shopping, transportation, telephone, housekeeping, laundry, managing money, taking medications)", answer: q4ChoiceAnswerFormat)
            q4Step.isOptional = false
            
            steps += [q4Step]

            // Question 5
            let q5Choices = [
                ORKTextChoice(text: "Always", value: 0 as NSNumber),
                ORKTextChoice(text: "Sometimes", value: 1 as NSNumber),
                ORKTextChoice(text: "Never", value: 2 as NSNumber)
            ]
            let q5ChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q5Choices)
            let q5Step = ORKQuestionStep(identifier: "q5", title: "", question: "When you need help, can you count on someone who is willing and able to meet your needs?", answer: q5ChoiceAnswerFormat)
            q5Step.isOptional = false
            
            steps += [q5Step]
            
            // Question 6-10
            let q6to10Choices = [
                ORKTextChoice(text: "Yes", value: 1 as NSNumber),
                ORKTextChoice(text: "No", value: 0 as NSNumber)
            ]
            let q6to10ChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q6to10Choices)
            let q6Step = ORKQuestionStep(identifier: "q6", title: "", question: "Do you use five or more different prescription medications on a regular basis?", answer: q6to10ChoiceAnswerFormat)
            q6Step.isOptional = false
            let q7Step = ORKQuestionStep(identifier: "q7", title: "", question: "At times, do you forget to take your prescription medications?", answer: q6to10ChoiceAnswerFormat)
            q7Step.isOptional = false
            let q8Step = ORKQuestionStep(identifier: "q8", title: "", question: "Have you recently lost weight such that your clothing has become looser?", answer: q6to10ChoiceAnswerFormat)
            q8Step.isOptional = false
            let q9Step = ORKQuestionStep(identifier: "q9", title: "", question: "Do you often feel sad or depressed?", answer: q6to10ChoiceAnswerFormat)
            q9Step.isOptional = false
            let q10Step = ORKQuestionStep(identifier: "q10", title: "", question: "Do you have a problem with losing control of urine when you don’t want to?", answer: q6to10ChoiceAnswerFormat)
            q10Step.isOptional = false
            
            steps += [q6Step, q7Step, q8Step, q9Step, q10Step]
            
            //SUMMARY
            let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
            summaryStep.title = "Thank you."
            summaryStep.text = "We appreciate your time."
            
            steps += [summaryStep]
            
            return ORKOrderedTask(identifier: "SurveyTask-Assessment", steps: steps)
        }()
        
        let taskViewController = ORKTaskViewController(task: sampleSurveyTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        
        // & present the VC!
        return taskViewController
    }
    
}
