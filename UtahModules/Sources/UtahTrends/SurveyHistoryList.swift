//
//  File.swift
//
//
//  Created by Emmy Thamakaison on 5/3/2566 BE.
//
import Foundation
import SwiftUI
import FHIR
import UtahSharedContext

struct SurveyHistoryList: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State var surveys: [QuestionnaireResponse] = []
    
    
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
        .task {
            firestoreManager.loadSurveys()
            recalculateChartData(basedon: firestoreManager.surveys)
        }
    }
    func recalculateChartData(basedon newSurveys: [QuestionnaireResponse]) {
        surveys = firestoreManager.surveys
    }
}
