//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import Account
import SwiftUI
import class FHIR.FHIR
import FirebaseAuth
import FirebaseFirestore
import UtahSharedContext


 public struct Trends: View {
    @EnvironmentObject var firestoreManager: FirestoreManager
    @State private var showStepCount = false
    @State private var showEdmonton = false
     
    public var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                DataCard(
                    icon: "figure.run",
                    title: "Edmonton Frail Scale",
                    unit: "points",
                    color: Color.blue
                )
                .onTapGesture {
                    self.showEdmonton.toggle()
                }
                .sheet(isPresented: $showEdmonton) {
                    EdmontonChart()
                }
                
                DataCard(
                    icon: "shoeprints.fill",
                    title: "Daily Step Count",
                    unit: "steps",
                    color: Color.green
                )
                .onTapGesture {
                    self.showStepCount.toggle()
                }
                .sheet(isPresented: $showStepCount) {
                    StepCountChart()
                }
                // removed survey for now until we pull survey data from firestore
                // DataCard(icon: "list.clipboard.fill", title: "Last EFS Survey Score", unit: "points", color: Color.blue, observations: [])
            }
            .padding()
            .navigationBarTitle("Trends")
        }
    }
    public init() {
    }
}

// This just removes this section from being counted in our % "test coverage"
#if !TESTING

struct Trends_Previews: PreviewProvider {
    static var previews: some View {
        Trends()
            .environmentObject(FHIR())
    }
}

#endif
