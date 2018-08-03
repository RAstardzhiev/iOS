//
//  CreateGoalVCTests.swift
//  Persistent Goal App
//
//  Created by eDynamix Global on 02/08/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import XCTest
@testable import Persistent_Goal_App

class CreateGoalVCTests: XCTestCase {
    
    var sut: CreateGoalVC!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "CreateGoalVC") as! CreateGoalVC
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
    func testTextAreaPlaseholder_ShouldDisappearWhenStartTaping() {
        sut.textViewDidBeginEditing(UITextView())
        
        XCTAssertEqual(sut.goalTextView.text, "", "Plaseholder must disappear after start taping in the text area")
        XCTAssertEqual(sut.goalTextView.textColor, #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), "Text color must be Black")
    }
    
    
    func testShortTermBtnTap_ShouldBeTheRightGreenShade() {
        sut.shortTermBtn.sendActions(for: UIControlEvents.touchUpInside)
        XCTAssertEqual(sut.shortTermBtn.backgroundColor, #colorLiteral(red: 0.2449921229, green: 0.6791521256, blue: 0.2991436346, alpha: 1), "Selected button color must be Green")
        XCTAssertEqual(sut.longTermBtn.backgroundColor, #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1), "Deselected button color must be Light Green")
    }
    
    func testShortTermBtnTap_ShouldMakeGoalTypeToShortTerm() {
        sut.shortTermBtn.sendActions(for: UIControlEvents.touchUpInside)
        XCTAssertEqual(sut.goalType, GoalType.shortTerm, "Selecting Short term must assign the appropriate value inside the controller")
    }
    
    func testLongTermBtn_ShouldBeTheRightGreenShade() {
        sut.longTermBtn.sendActions(for: UIControlEvents.touchUpInside)
        XCTAssertEqual(sut.longTermBtn.backgroundColor, #colorLiteral(red: 0.2449921229, green: 0.6791521256, blue: 0.2991436346, alpha: 1), "Selected button color must be Green")
        XCTAssertEqual(sut.shortTermBtn.backgroundColor, #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1), "Deselected button color must be Light Green")
    }
    
    func testLongTermBtn_ShouldMakeGoalTypeToLongTerm() {
        sut.longTermBtn.sendActions(for: UIControlEvents.touchUpInside)
        XCTAssertEqual(sut.goalType, GoalType.longTerm, "Selecting Long term must assign the appropriate value inside the controller")
    }
}
