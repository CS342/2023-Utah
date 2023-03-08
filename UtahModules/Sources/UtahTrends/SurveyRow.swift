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
    var surveyHistory: QuestionnaireResponse

    var body: some View {
        HStack {
            Text(surveyHistory.authored)
            Text(surveyHistory.questionnaire)
        }
    }
}

//struct SurveyRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyRow(surveyHistory: surveyHistory[0])
//    }
//}
