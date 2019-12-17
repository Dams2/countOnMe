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
    
    func testGivenAHelper_WhenValidateIndex_ThenReturnIsNotEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateIndex(index: 1, count: 2)
        
        XCTAssertNotNil(result)
    }
    
    func testGivenAHelper_WhenValidateIndex_ThenReturnIsNil_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateIndex(index: 3, count: 2)
        
        XCTAssertNil(result)
    }
    
    func testGivenAHelper_WhenValidateFirstElement_ThenReturnIsNotEmpty_IsCorrectlyReturned()  {
        
        let helper = Helper()
        
        let result = helper.validateFirstElement(in: "t")
        
        XCTAssertNotNil(result)
    }
    
    func testGivenAHelper_WhenValidateFirstElement_ThenReturnIsEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateFirstElement(in: "")
        
        XCTAssertEqual(result, "")
    }
    
    func testGivenAHelper_WhenValidateLastJoinedElement_ThenReturnIsNotEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateLastJoinedElement(in: "t")
        
        XCTAssertNotNil(result)
    }

    func testGivenAHelper_WhenValidateLastJoinedElement_ThenReturnIsEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
        
        let result = helper.validateLastJoinedElement(in: "    ")
        
        XCTAssertNil(result)
    }
    
    func testGivenAHelper_WhenValidateLastElement_ThenReturnIsNotEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
         let result = helper.validateLastElement(in: "T")
        
         XCTAssertNotNil(result)
    }
    
    func testGivenAHelper_WhenValidateLastElement_ThenReturnIsEmpty_IsCorrectlyReturned() {
        
        let helper = Helper()
        let result = helper.validateLastElement(in: "")
       
        XCTAssertEqual(result, "")
    }
    
}
