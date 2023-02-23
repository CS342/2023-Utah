//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

// swiftlint:disable lower_acl_than_parent
import Firebase
import Foundation
import ResearchKit
import ModelsR4

class WIQViewCoordinator: NSObject, ORKTaskViewControllerDelegate {
    // called when the survey is completed, need to figure out how to upload data to firestore
    public func taskViewController(
        _ taskViewController: ORKTaskViewController,
        didFinishWith reason: ORKTaskViewControllerFinishReason,
        error: Error?
    ) {
        switch reason {
        case .completed:
            // Convert the responses into a FHIR object using ResearchKitOnFHIR
            let fhirResponses = taskViewController.result.fhirResponse

            // Add a patient identifier to the response so we know who did this survey
            fhirResponses.subject = Reference(reference: FHIRPrimitive(FHIRString("Patient/PATIENT_ID")))

            do {
                // Parse the FHIR object into JSON
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted

                // Print out the JSON for debugging
                let data = try encoder.encode(fhirResponses)
                let json = String(decoding: data, as: UTF8.self)
                print(json)
            } catch {
                // Something didn't work!
                print(error.localizedDescription)
            }
        default:
            break
        }

        // We're done, dismiss the survey
        taskViewController.dismiss(animated: true, completion: nil)
    }
}
