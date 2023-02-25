//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//


import Charts
import SwiftUI

//// Edmonton frail scale
//struct EFS: Identifiable {
//    let date: String
//    let score: Int
//    var id = UUID()
//}
//
//// Step count
//struct StepCount: Identifiable {
//    let date: String
//    let count: Int
//    var id = UUID()
//}
//
//// Date converter to string
//func date_formatter(date: Date) -> String {
//    let dateFormatter = DateFormatter()
//    dateFormatter.locale = Locale(identifier: "en_US")
//    let formatted = dateFormatter.string(from: date)
//    return formatted
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
//
//var stepDummyData: [StepCount] = [
//    .init(date: "MON", count: 5000),
//    .init(date: "TUES", count: 6000),
//    .init(date: "WED", count: 3809),
//    .init(date: "THURS", count: 4072),
//    .init(date: "FRI", count: 12000),
//    .init(date: "SAT", count: 220),
//    .init(date: "SUN", count: 2000)
//]
//
//// Initializing barcharts
//struct EFSBarChart: View {
//    var body: some View {
//        Chart {
//            ForEach(efsDummyData) { datum in
//                BarMark(
//                    x: .value("Date", datum.date),
//                    y: .value("Edmonton Frail Scale Score", datum.score)
//                )
//            }
//        }
////        .chartXAxisLabel(position: .bottom, alignment: .center) {
////            Text("Date")
////                .font(.system(size: 15, weight: .bold, design: .default))
////        }
//    }
//}
//
//struct StepBarChart: View {
//    var body: some View {
//        Chart {
//            ForEach(stepDummyData) { datum in
//                BarMark(
//                    x: .value("Date", datum.date),
//                    y: .value("Step Count", datum.count)
//                )
//            }
//        }
////        .chartXAxisLabel(position: .bottom, alignment: .center) {
////            Text("Date")
////                .font(.system(size: 15, weight: .bold, design: .default))
////        }
//    }
//}

struct DataCard: View {
    let icon: String
    let title: String
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .center) {
            // title
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: icon)
                Text(title)
                    .font(.headline)
            }
            VStack(alignment: .center) {
//                Text("Step Count")
//                    .font(.headline)
//                StepBarChart()
//                Spacer()
//                Text("Edmonton Frail Scale")
//                    .font(.headline)
//                    .padding(.top)
//                EFSBarChart()
                Text("500")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                Text(unit)
                Spacer()
            }
        }
        // .frame(width: 380)
        .padding(30)
        .frame(width: 350, height: 110)
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
