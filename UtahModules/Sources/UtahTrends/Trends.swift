//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import SwiftUI

public struct Trends: View {
    public var body: some View {
        VStack (alignment: .leading){
            DataCard(icon: "shoeprints.fill", title: "Daily Step Count", unit: "steps", color: Color.green)
            DataCard(icon: "heart.fill", title: "Average Heart Rate", unit: "bpm", color: Color.red)
        }
    }
    
    
    public init() {}
}

#if !TESTING

struct Trends_Previews: PreviewProvider {
    static var previews: some View {
        Trends()
    }
}

#endif
