//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//
// swiftlint:disable multiline_arguments

import Foundation
import SwiftUI

struct StyledGauge: View {
    @State private var userScore = 67.0
    @State private var minScore = 50.0
    @State private var maxScore = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])

    var body: some View {
        Gauge(value: userScore, in: minScore...maxScore) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
        } currentValueLabel: {
            Text("\(Int(userScore))")
                .foregroundColor(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minScore))")
                .foregroundColor(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxScore))")
                .foregroundColor(Color.red)
        }
        .gaugeStyle(.accessoryCircular)
        .tint(gradient)
    }
}

struct Gauge_Previews: PreviewProvider {
    static var previews: some View {
        StyledGauge()
    }
}
