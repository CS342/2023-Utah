//
//  File.swift
//  
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//
// swiftlint:disable identifier_name

import Foundation
import Account
import FHIR
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Foundation
import ModelsR4
import SwiftUI



struct QuestionResponse: Codable {
    var question: [String]
    var answer: String
}

public struct SurveyHistoryWrapper: View {
    @State var surveys: [(surveyName: String, date: Date, score: Double, responses: [String])] = []
    
    public var body: some View {
            SurveyHistoryList(surveys: self.$surveys)
                .task {
                    try? await _Concurrency.Task.sleep(for: .seconds(0.1))
                    loadSurveys()
                }
        }
    
    func loadSurveys() {
        var surveys = [] as [(surveyName: String, date: Date, score: Double, responses: [String])]
        if let user = Auth.auth().currentUser {
            Firestore.firestore().collection("users/\(user.uid)/QuestionaireResponse").getDocuments {documents, err in
                if err != nil {
                    return
                } else {
                    for document in documents!.documents {
                        let data = document.data() as [String: Any]
                        let score = data["score"] as String
                        let surveyId = data["surveyId"] as String
                        let type = data["type"] as String
                        querySurveys(type: type, surveyId: surveyId)
                    }
                }
            }
        }
    }
    
    func querySurveys(type: String, surveyId: String) {
        let allResponses = [] as [QuestionResponse]
        if let user = Auth.auth().currentUser {
            var surveyName = "veinesssurveys"
            if type == "edmonton" {
                surveyName = "edmontonsurveys"
            } else if type == "wiq" {
                surveyName = "wiqsurveys"
            }
            Firestore.firestore().collection("\(surveyName)/\(user.uid)/\(surveyId)").getDocuments {documents, err in
                if err != nil {
                    return
                } else {
                    for document in documents!.documents {
                        let data = document.data() as [String: Any]
                        let questionResponse = data["item"] as [QuestionResponse]
                        allResponses.append(questionResponse)
                    }
                }
            }
        }
    }
}
