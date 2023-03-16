//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//


import Charts
import SwiftUI
import FirebaseFirestore
import UtahSharedContext

//// Edmonton frail scale
//struct EFS: Identifiable {
//    let date: String
//    let score: Int
//    var id = UUID()
//}
//
//
//// dummy data
//let efsDummyData: [EFS] = [
//    .init(date: "January", score: 15),
//    .init(date: "February", score: 17),
//    .init(date: "March", score: 3),
//    .init(date: "April", score: 8),
//    .init(date: "May", score: 9)
//]

struct MonthScorePair: Identifiable {
    let id = UUID()
    let month: String
    let score: Int
}

struct EdmontonChart: View {
    @StateObject var edmontonChartData = EdmontonChartData()
    @EnvironmentObject var firestoreManager: FirestoreManager

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center) {
                Text("Edmonton Frail Scale")
                    .font(.headline)
                    .padding(.top)
                Chart {
                    ForEach(edmontonChartData.firstDataForEachMonth(inMonths: 6, from: firestoreManager.surveys["edmonton"])) { datum in
                        BarMark(
                            x: .value("Date", datum.month),
                            y: .value("Edmonton Frail Scale Score", datum.score)
                        )
                    }
                }
            }
        }
        .padding(30)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(.systemBackground))
                .shadow(radius: 5)
        }
    }
}
