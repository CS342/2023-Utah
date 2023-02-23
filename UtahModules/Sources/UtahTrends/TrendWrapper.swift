//
//  SwiftUIView.swift
//  
//
//  Created by Jennifer Xu on 2/21/23.

import FHIR
import ModelsR4
import SwiftUI


 public struct TrendWrapper: View {
    let icon: String
    let title: String
    let unit: String
    let color: Color
    let code: String
    @EnvironmentObject var fhirStandard: FHIR
    @State var observations: [Observation] = []
    
    
    public var body: some View {
        
        
        DataCard(icon: icon, title: title, unit: unit, color: color, observations: observations)
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
     
     public init (code: String, icon: String, title: String, unit: String, color: Color) {
         self.code = code
         self.icon = icon
         self.title = title
         self.unit = unit
         self.color = color
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
