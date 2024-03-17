//
//  MainScreen.swift
//  ReferenceiOSUITests
//
//  Created by Nourhan Mohamed on 17/03/2024.
//  Copyright © 2024 ABN AMRO. All rights reserved.
//

import Foundation
import XCTest

class MainScreen {
    
    let button = XCUIApplication().buttons.matching(identifier: "Button").firstMatch

    func tapButton() {
        button.tap()
    }
    
    func getText() -> String {
        let label = XCUIApplication().staticTexts.matching(identifier: "label").firstMatch.label
        
        return label
    }
    
    func getCurrency() -> Character {
        let amount = XCUIApplication().staticTexts.matching(identifier: "label").firstMatch.label
        let fullAmountArray = Array(amount)
        let currency = fullAmountArray[0]
        
        return currency
    }
    
    func getDecimalSeparator(separator: Character) -> String {
        let amount = XCUIApplication().staticTexts.matching(identifier: "label").firstMatch.label
        guard let separatorIndex = amount.firstIndex(of: separator) else {
            XCTFail("Invalid amount format: No decimal point found")
            return ""
        }
        return String(amount[separatorIndex])
    }
    
    func getDecimalCount() -> Int {
        let amount = XCUIApplication().staticTexts.matching(identifier: "label").firstMatch.label
        guard let separatorIndex = amount.firstIndex(of: ",") else {
            XCTFail("Invalid amount format: No decimal point found")
            
            return 0
        }
        let decimalIndex = amount.index(after: separatorIndex)
        let decimalIndexAsInt = amount.distance(from: amount.startIndex, to: decimalIndex)
        let amountArrayCount = Array(amount).count
        let decimalCount = amountArrayCount - decimalIndexAsInt
        
        return decimalCount
    }
}
