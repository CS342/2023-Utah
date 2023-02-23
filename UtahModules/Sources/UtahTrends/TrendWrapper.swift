//
//  SwiftUIView.swift
//  
//
//  Created by Jennifer Xu on 2/21/23.

import FHIR
import ModelsR4
import SwiftUI


 public struct TrendWrapper: View {
    let code: String
    @EnvironmentObject var fhirStandard: FHIR
    @State var observations: [Observation] = []
    
    
    public var body: some View {
        DataCard(icon: "shoeprints.fill", title: "Daily Step Count", unit: "steps", color: Color.green, observations: observations)
            .task {
                loadObservations()
            }
            .onReceive(fhirStandard.objectWillChange.receive(on: RunLoop.main)) {
                _Concurrency.Task {
                    try? await _Concurrency.Task.sleep(for: .seconds(0.1))
                    loadObservations()
                }
            }
    }
     
     public init (code: String) {
         self.code = code
     }
    
    
    func loadObservations() {
        _Concurrency.Task { @MainActor in
            let observations = await fhirStandard.resources(resourceType: Observation.self)
            self.observations = observations.filter { observation in
                observation.code.coding?.contains(where: { coding in coding.code?.value?.string == code }) ?? false
            }
        }
    }
}
