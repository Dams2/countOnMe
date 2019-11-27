//
//  HelperTests.swift
//  CountOnMeTests
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

@testable import CountOnMe
import XCTest

final class HelperTests: XCTestCase {
    
    func testGivenAHelper_WhenvalidateLastJoinedElement_ThenReturnIsNotEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateLastJoinedElement(in: "t")
        
        XCTAssertNotNil(result)
    }

    func testGivenAHelper_WhenvalidateLastJoinedElement_ThenReturnIsNil_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateLastJoinedElement(in: "    ")
        
        XCTAssertNil(result)
    }
    
    func testGivenAHelper_WhenvalidateLastElement_ThenReturnIsNotEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
         let result = helper.validateLastElement(in: "T")
        
         XCTAssertNotNil(result)
    }
    
    func testGivenAHelper_WhenvalidateLastElement_ThenReturnIsNil_IsCorrectlyReturned() {
        
        let helper = Helper()
        let result = helper.validateLastElement(in: "")
       
        XCTAssertEqual(result, "")
    }
    
}
