//
//  BoardToDeathUITests.swift
//  BoardToDeathUITests
//
//  Created by eDynamix Global on 07/08/2018.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import BoardToDeath

class BoardToDeathUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        app = nil
        super.tearDown( )
    }
    
    func testOnBoarding_WelcomeLabel_ShouldAppear() {
        app.launch()
        XCTAssertTrue(app.staticTexts["Welcome to BoardToDeath"].exists, "Starting the app should display a Welcome label")
    }
    
    func testOnBoarding_WhenSwiped_NextVCLoads() {
        app.launch()
        app.swipeLeft()
        XCTAssertTrue(app.staticTexts["Custom Puppy Content"].exists)
    }
    
    func testOnBoarding_WhenFinished_OnboardVCDismiss() {
        app.launch()
        
        XCTAssertTrue(app.isDisplayingOnboarding)
        
        app.swipeLeft()
        app.swipeLeft()
        app.buttons["Done"].tap()
        
        XCTAssertFalse(app.isDisplayingOnboarding)
    }
    
    func testInterfaceVC_AlertViewShows_WhenOnboardingComplete() {
        app.launch()
        
        app.swipeLeft()
        app.swipeLeft()
        app.buttons["Done"].tap()
        
        XCTAssertTrue(app.isDisplayingAlertVC)
    }
    
    func testEmailInput_WhenGivenInput_FillsTextField() {
        app.launch()
        
        app.swipeLeft()
        app.swipeLeft()
        app.buttons["Done"].tap()
        
        let textField = app.textFields["Email"]
        
        XCTAssertTrue(textField.exists, "Email Input field is not available!")
        
        let testEmail = "test@email.com"
        
        textField.tap()
        textField.typeText(testEmail)
        
        let emailTextFieldValue = textField.value as! String
        
        XCTAssertEqual(emailTextFieldValue, testEmail, "Entered text does not apear in the Email field!")
    }
    
    func testImageDownload_WhenDownloadingComplete_CaptionLabelShowing() {
        app.launch()
        
        let imageCaption = app.staticTexts["What a beautiful image!"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: imageCaption, handler: nil)
        
        app.swipeLeft()
        app.swipeLeft()
        
        app.buttons["Done"].tap()
        app.alerts["You did it!"].buttons["Awesome!"].tap()
        app.buttons["Load Image"].tap()
        
        // Wait for completion (particular amount of time in seconds)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(imageCaption.exists)
    }
}

extension XCUIApplication {
    var isDisplayingOnboarding: Bool {
        return otherElements["onboardingView"].exists
    }
    
    var isDisplayingAlertVC: Bool {
        return alerts["You did it!"].exists
    }
}
