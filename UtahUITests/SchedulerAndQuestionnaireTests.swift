//
// This source file is part of the CS342 2023 Utah Team Application project
//
// SPDX-FileCopyrightText: 2023 Stanford University
//
// SPDX-License-Identifier: MIT
//

import XCTest
import XCTestExtensions


class SchedulerAndQuestionnaireTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["--skipOnboarding"]
        app.deleteAndLaunch(withSpringboardAppName: "U-STEP")
    }
    
    
    func testSchedulerAndQuestionnaire() throws {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.tabBars["Tab Bar"].buttons["Questions"].waitForExistence(timeout: 2))
        app.tabBars["Tab Bar"].buttons["Questions"].tap()

        XCTAssertTrue(app.staticTexts["Questionnaire"].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["Please complete this task once a month."].waitForExistence(timeout: 2))
        XCTAssertTrue(app.staticTexts["Start Task"].waitForExistence(timeout: 2))
        app.staticTexts["Start Task"].tap()
        
        try app.testSurveyLogic()
    }
    
    func testVideoDemo() throws {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.tabBars["Tab Bar"].buttons["Questions"].waitForExistence(timeout: 2))
        app.tabBars["Tab Bar"].buttons["Questions"].tap()

        XCTAssertTrue(app.buttons["Video Demo"].waitForExistence(timeout: 2))
        app.buttons["Video Demo"].tap()
        
        XCTAssertTrue(app.staticTexts["Demonstration Below"].waitForExistence(timeout: 2))
    }
}

extension XCUIApplication {
    
    func testSurveyLogic() throws {
        try testEdmontonSurvey()
        if staticTexts["Walking Impairement Questionnaire"].waitForExistence(timeout: 5) {
            try testWIQSurvey()
        }
        if staticTexts["VEINES-QOL/Sym Questionnaire"].waitForExistence(timeout: 5) {
            try testVEINESSurvey()
        }
    }
    
    private func testEdmontonSurvey() throws {
        XCTAssertTrue(staticTexts["Patient Questionnaire"].waitForExistence(timeout: 2))
        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 2))
        buttons["Next"].tap()
        XCTAssertTrue(staticTexts["Draw a clock"].waitForExistence(timeout: 2))
        XCTAssertTrue(buttons["Get Started"].waitForExistence(timeout: 2))
        buttons["Get Started"].tap()
        
        XCTAssertTrue(buttons["Skip"].waitForExistence(timeout: 2))
        buttons["Skip"].tap()
        
        // Go through each question
        let answers = ["0", "Good", "5-8", "Sometimes", "Yes", "No", "Yes", "No", "No"]
        for answer in answers {
            XCTAssertTrue(tables.staticTexts[answer].waitForExistence(timeout: 2))
            tables.staticTexts[answer].tap()
            XCTAssertTrue(tables.buttons["Next"].waitForExistence(timeout: 2))
            tables.buttons["Next"].tap()
        }
        
        XCTAssertTrue(staticTexts["Get Up and Go"].waitForExistence(timeout: 2))
        XCTAssertTrue(buttons["Next"].waitForExistence(timeout: 2))
        buttons["Next"].tap()
    }
    
    private func testWIQSurvey() throws {
        // Go through each question
        let answers = [
            "No Difficulty",
            "Slight Difficulty",
            "Some Difficulty",
            "Much Difficulty",
            "Unable to Do",
            "Slight Difficulty",
            "No Difficulty"
        ]
        for answer in answers {
            XCTAssertTrue(tables.staticTexts[answer].waitForExistence(timeout: 2))
            tables.staticTexts[answer].tap()
            XCTAssertTrue(tables.buttons["Next"].waitForExistence(timeout: 2))
            tables.buttons["Next"].tap()
        }
    }
    
    private func testVEINESSurvey() throws {
        //
    }
}
