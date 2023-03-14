//
//  File.swift
//
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//
import Foundation
import SwiftUI
import FHIR

struct SurveyRow: View {
    var dateCompleted: Date
    let dateFormatter = DateFormatter()
    
    var body: some View {
        Text(dateCompleted, format: .dateTime)
    }
}

//struct SurveyRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyRow(surveyHistory: surveyHistory[0])
//    }
//}
