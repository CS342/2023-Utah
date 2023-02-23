//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import XCTest


class TrendsTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        try disablePasswordAutofill()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["--showOnboarding"]
        app.deleteAndLaunch(withSpringboardAppName: "Utah")
    }
    
    
    func testTrends() throws {
        let app = XCUIApplication()
        try app.conductOnboardingIfNeeded()
        try exitAppAndOpenHealth(.steps)
        app.activate()
        sleep(5)
        try navigateToTrends()
        
        
        
    }
    
    func navigateToTrends() throws {
        let app = XCUIApplication()
        XCTAssertTrue(app.tabBars["Tab Bar"].buttons["Trends"].waitForExistence(timeout: 0.5))
        app.tabBars["Tab Bar"].buttons["Trends"].tap()
        
        XCTAssertTrue(app.staticTexts["Daily Step Count"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(app.staticTexts["42.0"].waitForExistence(timeout: 0.5))
        XCTAssertTrue(app.staticTexts["Survey Score"].waitForExistence(timeout: 0.5))
    }
}
