//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import XCTest


class ProfileTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["--skipOnboarding"]
        app.launch()
    }
    
    
    func testProfile() throws {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.tabBars["Tab Bar"].buttons["Profile"].waitForExistence(timeout: 2))
        app.tabBars["Tab Bar"].buttons["Profile"].tap()
        
        XCTAssertTrue(app.staticTexts["Jiahui Chen"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["Patient at University of Utah Hospital"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["EMAIL"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["jane@example.com"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["CONDITION"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["Peripheral Arterial Disease"].waitForExistence(timeout: 2))
        
        app.buttons["Edit"].tap()
        XCTAssertTrue(app.staticTexts["CONDITION"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["Select your condition"].waitForExistence(timeout: 2))
        app.buttons["Save"].tap()
        
        XCTAssertTrue(app.buttons["Need help?"].waitForExistence(timeout: 2))
        app.buttons["Need help?"].tap()
        XCTAssertTrue(app.staticTexts["REPORT A PROBLEM"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["SUPPORT"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["WITHDRAW FROM STUDY"].waitForExistence(timeout: 2))
    }
}
