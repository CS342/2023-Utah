//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import Foundation
import Combine
import FirebaseFirestore
import UtahSharedContext


class EdmontonChartData: ObservableObject {
    func firstDataForEachMonth(inMonths range: Int, from surveys: [String: [(dateCompleted: Date, score: Int, surveyId: String)]]) -> [(month: String, score: Int)] {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let mostRecentDate = surveys
            .flatMap { $0 }
            .map { $0.dateCompleted }
            .max() ?? Date()
        
        let sixMonthsAgo = calendar.date(byAdding: .month, value: -range, to: mostRecentDate)!
        
        var monthScorePairs: [(month: String, score: Int)] = []
        
        for surveyData in surveys {
            for survey in surveyData {
                let dateCompleted = survey.dateCompleted
                
                if dateCompleted >= sixMonthsAgo && dateCompleted <= mostRecentDate {
                    let month = dateFormatter.string(from: dateCompleted)
                    
                    if !monthScorePairs.contains(where: { $0.month == month }) {
                        monthScorePairs.append((month: month, score: survey.score))
                    }
                }
            }
        }
        return monthScorePairs.sorted { $0.month < $1.month }
    }
}

