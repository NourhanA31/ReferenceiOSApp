//
//  DifferentLocaleTests.swift
//  ReferenceiOSUITests
//
//  Created by Nourhan Mohamed on 17/03/2024.
//  Copyright © 2024 ABN AMRO. All rights reserved.


// Note: The setup function didn't change the device locale so this test is invalid. Further investigation needed to know why the app is not launched with the specified locale
//

import XCTest

class DifferentLocaleTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        
        // Set the launch environment to change the simulator's locale to United states so that the separtor format changes from comma to dot
        app.launchEnvironment["AppleLanguages"] = "[\"en-US\"]"
        app.launch()
    }
    
    func testDecimalSeparatorFollowDeviceLocale() {
        let mainScreen = MainScreen()
        mainScreen.tapButton()
        let decimalSeparator = mainScreen.getDecimalSeparator(separator: ".")
        
        XCTAssertEqual(decimalSeparator, ".", "The decimal separator is not matching the locale")
    }
}
