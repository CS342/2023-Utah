//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import Account
import class FHIR.FHIR
import FirebaseAccount
import FirebaseAuth
import FirebaseFirestore
import Onboarding
import SwiftUI

public struct Profile: View {
    @State var disease = "Peripheral Arterial Disease"
    @StateObject var firestoreManager = FirestoreManager()
    public var body: some View {
        VStack {
            EditButton(disease: $disease)
                .padding(.trailing, 35)
            Header()
            ProfileText()
                .padding(.bottom, 30)
            UserInformationView()
        }
        .padding(.top, 30)
        .environmentObject(firestoreManager)
    }
    public init() {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
