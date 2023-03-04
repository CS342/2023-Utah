//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: Emmy Thamakaison
//
// SPDX-License-Identifier: MIT
// This code has been copied and modified from Tobia Tiemerding's original code from this repository: https://github.com/honkmaster/TTGaugeView

import Foundation
import SwiftUI

struct StyledGauge: View {
    @State private var userScore = 100.0
    @State private var minScore = 50.0
    @State private var maxScore = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    
    let angle: Double = 260.0
    let sections: [TTGaugeViewSection] = [
        TTGaugeViewSection(color: .green, size: 0.333),
        TTGaugeViewSection(color: .yellow, size: 0.333),
        TTGaugeViewSection(color: .red, size: 0.333)
    ]
    let gaugeDescription = "Risk"
    
    var body: some View {
        TTGaugeView(
            angle: angle,
            sections: sections,
            userValue: userScore,
            maxValue: maxScore,
            minValue: minScore,
            gaugeDescription: gaugeDescription
        )
        
//        Gauge(value: userScore, in: minScore...maxScore) {
//            Image(systemName: "heart.fill")
//                .foregroundColor(.red)
//        } currentValueLabel: {
//            Text("\(Int(userScore))")
//                .foregroundColor(Color.green)
//        } minimumValueLabel: {
//            Text("\(Int(minScore))")
//                .foregroundColor(Color.green)
//        } maximumValueLabel: {
//            Text("\(Int(maxScore))")
//                .foregroundColor(Color.red)
//        }
//        .gaugeStyle(.accessoryCircular)
//        .tint(gradient)
//        Spacer()
        
    }
}

struct Gauge_Previews: PreviewProvider {
    static var previews: some View {
        StyledGauge()
    }
}
