//
//  ButtonMasherUITests.swift
//  ButtonMasherUITests
//
//  Created by eDynamix Global on 07/08/2018.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest

class ButtonMasherUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testChangeColorButton_WhenTapped_ShouldShowLabel() {
        app.buttons["Change Color"].tap()
        XCTAssertTrue(app.staticTexts["Now THAT's colorful!"].exists)
    }
}
