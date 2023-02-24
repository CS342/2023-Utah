//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//


import Charts
import SwiftUI
// import ResearchKit

// Edmonton frail scale
struct EFS: Identifiable {
    var date: String
    var score: Int
    var id = UUID()
}

// Step count
struct StepCount: Identifiable {
    var date: String
    var count: Int
    var id = UUID()
}

// Date converter to string
func date_formatter(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    let formatted = dateFormatter.string(from: date)
    return formatted
}


// dummy data
var efsDummyData: [EFS] = [
    .init(date: date_formatter(date: Date()), score: 15),
    .init(date: date_formatter(date: Date().addingTimeInterval(60 * 60 * 24 * 30)), score: 17),
    .init(date: date_formatter(date: Date().addingTimeInterval(60 * 60 * 24 * 60)), score: 3)
]

var stepDummyData: [StepCount] = [
    .init(date: date_formatter(date: Date()), count: 5000),
    .init(date: date_formatter(date: Date().addingTimeInterval(60 * 60 * 24)), count: 6000),
    .init(date: date_formatter(date: Date().addingTimeInterval(60 * 60 * 24 * 2)), count: 3809)
]

// Initializing barcharts
struct EFSBarChart: View {
    var body: some View {
        Chart {
            ForEach(efsDummyData) { datum in
                BarMark(
                    x: .value("Date", datum.date),
                    y: .value("Edmonton Frail Scale Score", datum.score)
                )
            }
        }
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text("Date")
                .font(.system(size: 15, weight: .bold, design: .default))
        }
    }
}

struct StepBarChart: View {
    var body: some View {
        Chart {
            ForEach(stepDummyData) { datum in
                BarMark(
                    x: .value("Date", datum.date),
                    y: .value("Step Count", datum.count)
                )
            }
        }
        .chartXAxisLabel(position: .bottom, alignment: .center) {
            Text("Date")
                .font(.system(size: 15, weight: .bold, design: .default))
        }
    }
}

struct DataCard: View {
    let icon: String
    let title: String
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
//            // title
//            HStack(alignment: .firstTextBaseline) {
//                Image(systemName: icon)
//                Text(title)
//                    .font(.headline)
//            }
//            .padding(.bottom, 2)
            // data
            VStack(alignment: .center) {
                Text("Step Count")
                    .font(.headline)
                StepBarChart()
                Spacer()
                Text("Edmonton Frail Scale")
                    .font(.headline)
                EFSBarChart()
//                Text("500")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(color)
//                Text(unit)
//                Spacer()
            }
        }
        .frame(width: 350)
        .padding(.leading, 20)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(.systemBackground))
                .shadow(radius: 5)
        }
    }
}

struct DataCard_Previews: PreviewProvider {
    static var previews: some View {
        DataCard(icon: "shoeprints.fill", title: "Daily Step Count", unit: "steps", color: Color.green)
    }
}
