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
import FirebaseFirestoreSwift


//struct QuestionResponse: Codable {
//    var question: String
//    var answer: [String]
//}

public struct SurveyHistoryWrapper: View {
    @State var surveys: [QuestionnaireResponse] = []
    
    public var body: some View {
        SurveyHistoryList(surveys: self.$surveys)
            .task {
                try? await _Concurrency.Task.sleep(for: .seconds(0.1))
                loadSurveys()
            }
    }
    
    func loadSurveys() {
        if let user = Auth.auth().currentUser {
            Firestore.firestore().collection("users/\(user.uid)/QuestionaireResponse").getDocuments {documents, err in
                if err != nil {
                    return
                } else {
                    for document in documents!.documents {
                        let data = document.data() as [String: Any]
                        let score = data["score"] as? String
                        let surveyId = data["surveyId"] as? String
                        let type = data["type"] as? String
                        querySurveys(type: type!, surveyId: surveyId!)
                    }
                }
            }
        }
    }
    
    func querySurveys(type: String, surveyId: String) {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        
        var surveyName = "veinesssurveys"
        if type == "edmonton" {
            surveyName = "edmontonsurveys"
        } else if type == "wiq" {
            surveyName = "wiqsurveys"
        }
        let docRef = db.collection(surveyName).document(surveyId)
        docRef.getDocument(as: QuestionnaireResponse.self) { result in
            switch result {
            case .success(let response):
                surveys.append(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//
//    func loadSurveys() {
//        var surveys = [] as [(surveyName: String, date: Date, score: Double, responses: [String])]
//        if let user = Auth.auth().currentUser {
//            Firestore.firestore().collection("users/\(user.uid)/QuestionaireResponse").getDocuments {documents, err in
//                if err != nil {
//                    return
//                } else {
//                    for document in documents!.documents {
//                        let data = document.data() as [String: Any]
//                        let score = data["score"] as String
//                        let surveyId = data["surveyId"] as String
//                        let type = data["type"] as String
//                        querySurveys(type: type, surveyId: surveyId)
//                    }
//                }
//            }
//        }
//    }
//
//    func querySurveys(type: String, surveyId: String) {
//        let allResponses = [] as [QuestionResponse]
//        if let user = Auth.auth().currentUser {
//            var surveyName = "veinesssurveys"
//            if type == "edmonton" {
//                surveyName = "edmontonsurveys"
//            } else if type == "wiq" {
//                surveyName = "wiqsurveys"
//            }
//            Firestore.firestore().collection("\(surveyName)/\(user.uid)/\(surveyId)").getDocuments {documents, err in
//                if err != nil {
//                    return
//                } else {
//                    for document in documents!.documents {
//                        let data = document.data() as [String: Any]
//                        let item = data["item"] as? [Any]
//                        if type == "edmonton" {
//                            let contents = item?[0] as? [String: Any]
//                            let q1 = contents?["linkId"] as? String
//                            let a1 = contents?["answer"] as? [Any]
//                            QuestionResponse(question: contents[""])
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
