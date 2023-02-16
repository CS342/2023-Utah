//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import XCTest


class GetUpAndGoTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["--skipOnboarding"]
        app.launch()
    }
    
    
    func testGetUpAndGo() throws {
        let app = XCUIApplication()
        
        // nothing to test yet
        XCTAssertFalse(app.tabBars["Tab Bar"].buttons["GetUpAndGo"].waitForExistence(timeout: 0.5))
    }
}
