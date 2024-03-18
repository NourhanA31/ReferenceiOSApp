//
//  MainScreenTests.swift
//  ReferenceiOSUITests
//
//  Created by Nourhan Mohamed on 18/03/2024.
//  Copyright © 2024 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest
import A11yUITests

class MainScreenTests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // This test to check all the a11y checks to all the buttons in the screen
    // This test is failing as the button used in the application is not recognized as interactive element as its height is not as per the a11y specification
    func test_buttons() {
        let buttons = XCUIApplication().buttons.allElementsBoundByIndex
        a11y(tests: a11yTestSuiteInteractive, on: buttons)
    }
    
    //This test to check all the a11y checks to all the labels in the screen
    // all the A11y checks for the labels is passing
    func test_labels() {
        let labels = XCUIApplication().staticTexts.allElementsBoundByIndex
        a11y(tests: a11yTestSuiteLabels, on: labels)
    }
    
    //This test to check all the A11y checks to all the amount labels in the screen
    // all the A11y checks for the labels is passing
    func test_amount() {
        MainScreen().tapButton()
        let labels = XCUIApplication().staticTexts.allElementsBoundByIndex
        a11y(tests: a11yTestSuiteLabels, on: labels)
    }
}
