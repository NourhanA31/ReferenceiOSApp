//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

class DefaultLocaleTests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIntialValue() {
        let initialValue = MainScreen().getText()
        
        XCTAssertEqual(initialValue, "Hello", "The intial value of the label is not Hello")
    }
    
    func testTextChangesAfterTapping() {
        let mainScreen = MainScreen()
        let intialValue = mainScreen.getText()
        mainScreen.tapButton()
        let currentValue = mainScreen.getText()
        
        XCTAssertNotEqual(currentValue, intialValue, "The text doesn't change after tapping the button")
    }
    
    // This test case validates that the amount is starting with the currency.
    func testCurrencyAppearnce() {
        let mainScreen = MainScreen()
        mainScreen.tapButton()
        let currency = mainScreen.getCurrency()
        
        XCTAssertEqual(currency, "€", "The amount is not starting with euro currency")
    }
    
    // This test case validates that the decimal separator is comma
    func testDecimalSeparator() {
        let mainScreen = MainScreen()
        mainScreen.tapButton()
        let decimalSeparator = mainScreen.getDecimalSeparator(separator: ",")
        
        XCTAssertEqual(decimalSeparator, ",", "The decimal separator is not matching the locale")
    }
    
    //This test case validates that the decimal count of the amount is 2
    func testAmountDecimalCount() {
        let mainScreen = MainScreen()
        mainScreen.tapButton()
        let decimalCount = mainScreen.getDecimalCount()
        
        XCTAssertEqual(decimalCount, 2, "The decimal number for the amount is not equal 2")
    }
}
