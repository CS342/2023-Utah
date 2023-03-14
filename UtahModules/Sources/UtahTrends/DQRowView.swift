//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
import Account
import Firebase
import FirebaseAuth
import FHIR
import Foundation
import FirebaseCore
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift
import UtahSharedContext

struct DQRowView: View {
    // questions and answers in same array
    
    // turn this into dictionary: q1:"Drawing Clock Test"
    @EnvironmentObject var firestoreManager: FirestoreManager
    var questionList = ["q1":"Drawing Clock Test",
                        "q2":"Times admitted to a hospital the past year",
                        "q3":"Description of overall health"]
    var surveyType : String
    @State var answerList = [QuestionList]()
    let questionnaireResponse : QuestionnaireResponse
    var body: some View {
        ScrollView {
            ForEach(answerList, id:\.self) { item in
                Text(item.questionDescription)
                    .padding(.all, 10)
                    .background(Rectangle().fill(Color.accentColor).shadow(radius: 3)
                        .cornerRadius(15)
                    )
                    .foregroundColor(.white)
                
                Spacer()
                Text(item.answer)
            }
            .font(.title)
            // call fn that returns this answer list - calls out to firebase, grabs all answers and returns tis list
        }.onAppear(perform: {answerList = [QuestionList(questionID: "q1", questionDescription: questionList["q1"] ?? "", answer: "yes"), QuestionList(questionID: "q2", questionDescription: questionList["q2"] ?? "", answer: "yes"), QuestionList(questionID: "q3", questionDescription: questionList["q3"] ?? "", answer: "yes")]})
    }
}
