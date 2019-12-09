//
//  CalculatorTests.swift
//  CountOnMeTests
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

@testable import CountOnMe
import XCTest

final class CalculatorTests: XCTestCase {
    
    // Addition
    
    func testGivenACalculator_WhenPressEqualAfterAnAdditionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculator = Calculator()
        
        let result = calculator.processCalcul(left: 1, operand: "+", right: 1)
        
        XCTAssertEqual(result, "2")
    }
    
    // Subtraction
    
    func testGivenACalculator_WhenPressEqualAfterAnSubtractionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculator = Calculator()
        
        let result = calculator.processCalcul(left: 1, operand: "-", right: 1)
        
        XCTAssertEqual(result, "0")
    }
    
    // Multiplication
    
    func testGivenACalculator_WhenPressEqualAfterAnMultiplicationWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculator = Calculator()
        
        let result = calculator.processCalcul(left: 1, operand: "*", right: 1)
        
        XCTAssertEqual(result, "1")
    }
    
    // Division
    
    func testGivenACalculator_WhenPressEqualAfterAnDivisionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculator = Calculator()
        
        let result = calculator.processCalcul(left: 1, operand: "/", right: 1)
        
        XCTAssertEqual(result, "1")
    }
    
    func testGivenACalculator_WhenprocessCalcult_ThenReturnIsNil_IsCorrectlyReturned() {
        
        let calculator = Calculator()
        
        let result = calculator.processCalcul(left: 8, operand: "j", right: 2)
        
        XCTAssertNil(result)
    }
}
