//
//  GoalsVCTests.swift
//  Persistent Goal App
//
//  Created by eDynamix Global on 02/08/2018.
//  Copyright © 2018 eDynamix Global. All rights reserved.
//

import XCTest
@testable import Persistent_Goal_App

class GoalsVCTests: XCTestCase {
    
    var sut: GoalsVC!
    
    override func setUp() {
        super.setUp()
        
        sut = GoalsVC()
        seedGoalsIfEmpty()
    }
    
    func test() {
        if sut.goals.count > 0 {
        sut.goals = []
        }
        
        XCTAssertTrue(sut.tableView.isHidden)
    }
}
