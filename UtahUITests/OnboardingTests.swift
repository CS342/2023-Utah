//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import XCTest
import XCTHealthKit


import XCTestExtensions


class OnboardingTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        try disablePasswordAutofill()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["--showOnboarding"]
        app.deleteAndLaunch(withSpringboardAppName: "Utah")
    }
    
    
    func testOnboardingFlow() throws {
        let app = XCUIApplication()
        
//        let nextButton = XCUIApplication().scrollViews.otherElements.buttons["Next"]
//        nextButton.tap()
//        nextButton.tap()
//        
//        let elementsQuery = XCUIApplication().scrollViews.otherElements
//        let nextButton = elementsQuery.buttons["Next"]
//        nextButton.tap()
//        nextButton.tap()
//        elementsQuery.textFields["Enter your given name ..."].tap()
//        
//        let enterYourFamilyNameTextField = elementsQuery.textFields["Enter your family name ..."]
//        enterYourFamilyNameTextField.tap()
//        enterYourFamilyNameTextField.tap()
//        elementsQuery.children(matching: .scrollView).element.swipeRight()
//        elementsQuery.buttons["I Consent"].tap()
//        elementsQuery.buttons["Grant Access"].tap()
//                        
        try app.navigateOnboardingFlow(assertThatHealthKitConsentIsShown: true)
        
        let tabBar = app.tabBars["Tab Bar"]
        XCTAssertTrue(tabBar.buttons["Questions"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(tabBar.buttons["Trends"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(tabBar.buttons["Profile"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(tabBar.buttons["Mock Upload"].waitForExistence(timeout: 0.5))
    }
}


extension XCUIApplication {
    func conductOnboardingIfNeeded() throws {
        if self.staticTexts["Welcome to\nVascuTrack"].waitForExistence(timeout: 0.5) {
            try navigateOnboardingFlow(assertThatHealthKitConsentIsShown: false)
        }
    }
    
    func navigateOnboardingFlow(assertThatHealthKitConsentIsShown: Bool = true) throws {
        try navigateOnboardingFlowWelcome()
        try navigateOnboardingFlowInterestingModules()
        
        if staticTexts["Consent"].waitForExistence(timeout: 0.5) {
            try navigateOnboardingFlowConsent()
        }
        try navigateOnboardingAccount()
        try navigateOnboardingFlowHealthKitAccess(assertThatHealthKitConsentIsShown: assertThatHealthKitConsentIsShown)
    }
    
    private func navigateOnboardingFlowWelcome() throws {
        //        XCTAssertTrue(staticTexts["Welcome to\nVascuTrack"].waitForExistence(timeout: 1.0))
        //        XCTAssertTrue(
        //            staticTexts["This application demonstrates several CardinalKit features & modules."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //
        //        XCTAssertTrue(staticTexts["Welcome to\nVascuTrack"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["The CardinalKit Framework builds the foundation of this template application."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //
        //        XCTAssertTrue(staticTexts["Swift Package Manager"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["CardinalKit uses the Swift Package Manager to import it as a dependency."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //
        //        XCTAssertTrue(staticTexts["CardinalKit Modules"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["CardinalKit offers several modules including HealthKit integration, questionnaires, and more ..."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //
        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 0.5))
        buttons["Next"].tap()
    }
    
    private func navigateOnboardingFlowInterestingModules() throws {
        XCTAssertTrue(staticTexts["What condition do you have?"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["Here are a few CardinalKit modules that are interesting to know about ..."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //
        //        XCTAssertTrue(staticTexts["Onboarding"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["The onboarding module allows you to build an onboarding flow like this one."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 0.5))
        //        buttons["Next"].tap()
        //
        //        XCTAssertTrue(staticTexts["FHIR"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["The FHIR module provides a CardinalKit standard that can be used as a communication standard between modules."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 0.5))
        buttons["Next"].tap()
        
        //        XCTAssertTrue(staticTexts["Contact"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["The contact module allows you to display contact information in your application."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 0.5))
        //        buttons["Next"].tap()
        //
        //        XCTAssertTrue(staticTexts["HealthKit Data Source"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["The HealthKit data source module allows you to fetch data from HealthKit and e.g. transform it to FHIR resources."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //
        //        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 0.5))
        //        buttons["Next"].tap()
    }
    
    private func navigateOnboardingFlowConsent() throws {
        XCTAssertTrue(staticTexts["Consent"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["CardinalKit can collect consent from a user. You can provide the consent document using a markdown file."]
        //                .waitForExistence(timeout: 0.5)
        //        )
        //        XCTAssertTrue(
        //            staticTexts["CardinalKit can render consent documents in the markdown format: This is a markdown example.\n"]
        //                .waitForExistence(timeout: 0.5)
        //        )
        
        
        XCTAssertTrue(staticTexts["Given Name"].waitForExistence(timeout: 2))
        try textFields["Enter your given name ..."].enter(value: "Leland")
        textFields["Enter your given name ..."].typeText("\n")
        
        XCTAssertTrue(staticTexts["Family Name"].waitForExistence(timeout: 2))
        try textFields["Enter your family name ..."].enter(value: "Stanford")
        textFields["Enter your family name ..."].typeText("\n")
        
        XCTAssertTrue(staticTexts["Leland Stanford"].waitForExistence(timeout: 2))
        staticTexts["Leland Stanford"].firstMatch.swipeUp()
        
        XCTAssertTrue(buttons["I Consent"].waitForExistence(timeout: 2))
        buttons["I Consent"].tap()
    }
    
    
    private func navigateOnboardingFlowHealthKitAccess(assertThatHealthKitConsentIsShown: Bool = true) throws {
        //        XCTAssertTrue(staticTexts["HealthKit"].waitForExistence(timeout: 0.5))
        //        XCTAssertTrue(
        //            staticTexts["CardinalKit can access data from HealthKit using the HealthKitDataSource module."].waitForExistence(timeout: 0.5)
        //        )
        XCTAssertTrue(images["heart.text.square.fill"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(buttons["Grant Access"].waitForExistence(timeout: 0.5))
        buttons["Grant Access"].tap()
        
        if self.navigationBars["Health Access"].waitForExistence(timeout: 30) {
            self.tables.staticTexts["Turn On All"].tap()
            self.navigationBars["Health Access"].buttons["Allow"].tap()
        } else if assertThatHealthKitConsentIsShown {
            XCTFail("Did not display the Health Consent Screen")
        }
    }
    
    private func navigateOnboardingAccount() throws {
        XCTAssertTrue(staticTexts["Your Account"].waitForExistence(timeout: 2))
        
        guard !buttons["Next"].waitForExistence(timeout: 5) else {
            buttons["Next"].tap()
            return
        }
        
        XCTAssertTrue(buttons["Sign Up"].waitForExistence(timeout: 2))
        buttons["Sign Up"].tap()
        
        XCTAssertTrue(navigationBars.staticTexts["Sign Up"].waitForExistence(timeout: 2))
        XCTAssertTrue(images["App Icon"].waitForExistence(timeout: 2))
        XCTAssertTrue(buttons["Email and Password"].waitForExistence(timeout: 2))
        
        buttons["Email and Password"].tap()
        
        try textFields["Enter your email ..."].enter(value: "leland@stanford.edu")
        swipeUp()
        
        secureTextFields["Enter your password ..."].tap()
        secureTextFields["Enter your password ..."].typeText("StanfordRocks")
        swipeUp()
        secureTextFields["Repeat your password ..."].tap()
        secureTextFields["Repeat your password ..."].typeText("StanfordRocks")
        swipeUp()
        
        try textFields["Enter your given name ..."].enter(value: "Leland")
        staticTexts["Repeat\nPassword"].swipeUp()
        
        try textFields["Enter your family name ..."].enter(value: "Stanford")
        staticTexts["Repeat\nPassword"].swipeUp()
        
        collectionViews.buttons["Sign Up"].tap()
        
        sleep(3)
        
        if staticTexts["HealthKit Access"].waitForExistence(timeout: 5) && navigationBars.buttons["Back"].waitForExistence(timeout: 5) {
            navigationBars.buttons["Back"].tap()
            
            XCTAssertTrue(staticTexts["Leland Stanford"].waitForExistence(timeout: 2))
            XCTAssertTrue(staticTexts["leland@stanford.edu"].waitForExistence(timeout: 2))
            XCTAssertTrue(scrollViews.otherElements.buttons["Next"].waitForExistence(timeout: 2))
            scrollViews.otherElements.buttons["Next"].tap()
        }
    }
}
