//
//  File.swift
//  
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//

import Foundation
import SwiftUI
import FHIR

struct SurveyHistoryList: View {
    @Binding var surveys: [QuestionnaireResponse]
    
    var body: some View {
        NavigationView {
            List(surveys) { survey in
                NavigationLink {
                    DetailedQuestionnaireView()
                } label: {
                    SurveyRow(surveyHistory: survey)
                }
            }
        }
    }
}

//struct SurveyHistoryList_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyHistoryList()
//    }
//}
