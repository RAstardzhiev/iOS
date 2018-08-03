//
//  UIButtonExtTests.swift
//  Persistent Goal App
//
//  Created by eDynamix Global on 02/08/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import XCTest
@testable import Persistent_Goal_App

class UIButtonExtTests: XCTestCase {
    
    var sut: UIButton!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = UIButton()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUIButton_ShouldHaveSelectedColor() {
        let selectedColor = #colorLiteral(red: 0.2449921229, green: 0.6791521256, blue: 0.2991436346, alpha: 1)
        sut.setSelectedColor()
        XCTAssertEqual(sut.backgroundColor, selectedColor, "The buttons color should be Green (#colorLiteral(red: 0.2449921229, green: 0.6791521256, blue: 0.2991436346, alpha: 1))")
    }
    
    func testUIButton_ShouldHaveDeselectedColor() {
        let deselectedColor = #colorLiteral(red: 0.6980392157, green: 0.8666666667, blue: 0.6862745098, alpha: 1)
        sut.setDeselectedColor()
        XCTAssertEqual(sut.backgroundColor, deselectedColor)
    }
    
}
