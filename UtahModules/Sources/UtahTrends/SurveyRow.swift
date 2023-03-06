//
//  File.swift
//  
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//

import Foundation
import SwiftUI

struct SurveyRow: View {
    var surveyHistory: SurveyHistory

    var body: some View {
        HStack {
            Text(surveyHistory.surveyName)
            Text(surveyHistory.date)
        }
    }
}

struct SurveyRow_Previews: PreviewProvider {
    static var previews: some View {
        SurveyRow(surveyHistory: surveyHistories[0])
    }
}
