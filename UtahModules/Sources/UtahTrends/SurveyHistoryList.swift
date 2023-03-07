//
//  File.swift
//  
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//

import Foundation
import SwiftUI

struct SurveyHistoryList: View {
    var body: some View {
        NavigationView {
            List(surveyHistories) { survey in
                NavigationLink {
                    DetailedQuestionnaireView()
                } label: {
                    SurveyRow(surveyHistory: survey)
                }
            }
        }
    }
}

struct SurveyHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        SurveyHistoryList()
    }
}
