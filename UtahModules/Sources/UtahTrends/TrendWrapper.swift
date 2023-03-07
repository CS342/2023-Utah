//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
// loadObservations funcution pulled from CardinalKit FHIRChart module

import Account
import FHIR
import Firebase
import FirebaseAuth
import Foundation
import ModelsR4
import SwiftUI


 public struct TrendWrapper: View {
    let icon: String
    let title: String
    let unit: String
    let color: Color
    let code: String
    @EnvironmentObject var fhirStandard: FHIR
    @State var observations: [(date: Date, value: Double)] = []
    
    
    public var body: some View {
        DataCard(icon: icon, title: title, unit: unit, color: color, observations: self.$observations)
            .task {
                try? await _Concurrency.Task.sleep(for: .seconds(0.1))
                loadObservations()
            }
    }
     
     public init (code: String, icon: String, title: String, unit: String, color: Color) {
         self.code = code
         self.icon = icon
         self.title = title
         self.unit = unit
         self.color = color
     }
    
    
    // filters data based on specified observation code
    func loadObservations() {
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
                        
                        if filterCode == self.code {
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
            }
       }
    
        /*_Concurrency.Task { @MainActor in
            
            self.observations = observations.filter { observation in
                observation.code.coding?.contains(where: { coding in coding.code?.value?.string == code }) ?? false
            }
        }*/
    }
}
