//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

// swiftlint:disable identifier_name
// swiftlint:disable type_contents_order
// swiftlint:disable legacy_objc_type
// swiftlint:disable force_unwrapping

import Account
import Firebase
import FirebaseAuth
import FHIR
import Foundation
import FirebaseCore
import FirebaseFirestore
import SwiftUI
import FirebaseFirestoreSwift

public class FirestoreManager: ObservableObject {
    private var db = Firestore.firestore()
    let user = Auth.auth().currentUser
    @Published public var disease: String = ""
    @Published public var observations: [(date: Date, value: Double)] = []
    @Published public var surveys: [QuestionnaireResponse] = []
    var refresh = false

    public func update() {
       refresh.toggle()
    }
    
    public func fetchData() {
        if let user = Auth.auth().currentUser {
            Firestore.firestore().collection("users").document(user.uid).getDocument {document, err in
                if let err = err {
                    print("Error loading document: \(err)")
                    return
                }
                if let document = document, document.exists {
                    let data = document.data()
                    if let data = data {
                        self.disease = data["disease"] as? String ?? ""
                    }
                }
            }
       }
    }
    
    public func loadSurveys() {
        if let user = Auth.auth().currentUser {
            Firestore.firestore().collection("users/\(user.uid)/QuestionnaireResponse").getDocuments{ documents, err in
                if err != nil {
                    return
                } else {
                    for document in documents!.documents {
                        let data = document.data() as [String: Any]
                        print(data)
                        let score = data["score"] as? String
                        let surveyId = data["surveyId"] as? String
                        let type = data["type"] as? String
                        self.querySurveys(type: type!, surveyId: surveyId!)
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
                    print(response)
                    self.surveys.append(response)
                case .failure(let error):
                    print(error)
                }
            }
        }
    
        
    public func loadObservations(metricCode: String) async {
        await withCheckedContinuation { continuation in
            var observations = [] as [(date: Date, value: Double)]
            if let user = Auth.auth().currentUser {
                Firestore.firestore().collection("users/\(user.uid)/Observation").getDocuments {documents, err in
                    if err != nil {
                        return
                    } else {
                        for document in documents!.documents {
                            // pulls data from firestore and tries to match code correct metric
                            let data = document.data() as [String: Any]
                            let codeObject = data["code"] as? [String: Any]
                            let coding = codeObject?["coding"] as? [Any]
                            let code = coding?[0] as? [String: Any]
                            let filterCode = code?["code"] as? String
                            
                            if filterCode == metricCode {
                                // properly formats date
                                let dateString = data["effectiveDateTime"] as? String
                                let formatter = ISO8601DateFormatter()
                                formatter.timeZone = NSTimeZone.local
                                let date = formatter.date(from: dateString!)
                                
                                let valueQuantity = data["valueQuantity"] as? [String: Any]
                                let value = valueQuantity?["value"] as? Double ?? 0.0
                                observations.append((date: date!, value: value))
                            }
                        }
                        self.observations = observations
                    }
                    continuation.resume()
                }
            } else {
                continuation.resume()
            }
        }
    
        /*_Concurrency.Task { @MainActor in
            
            self.observations = observations.filter { observation in
                observation.code.coding?.contains(where: { coding in coding.code?.value?.string == code }) ?? false
            }
        }*/
    }
    
    public init() {
        fetchData()
        Task {
            loadSurveys()
            await loadObservations(metricCode: "55423-8")
        }
    }
}
