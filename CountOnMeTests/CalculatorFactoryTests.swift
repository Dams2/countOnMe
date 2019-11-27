//
//  CalculatorFactoryTests.swift
//  CountOnMeTests
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

@testable import CountOnMe
import XCTest

final class CalculatorFactoryTests: XCTestCase {
    
    // Addition
    
    func testGivenACalculatorFactory_WhenPressEqualAfterAnAdditionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculatorFactory = CalculatorFactory()
        
        let result = calculatorFactory.processCalcul(left: 1, operand: "+", right: 1)
        
        XCTAssertEqual(result, "2")
    }
    
    // Subtraction
    
    func testGivenACalculatorFactory_WhenPressEqualAfterAnSubtractionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculatorFactory = CalculatorFactory()
        
        let result = calculatorFactory.processCalcul(left: 1, operand: "-", right: 1)
        
        XCTAssertEqual(result, "0")
    }
    
    // Multiplication
    
    func testGivenACalculatorFactory_WhenPressEqualAfterAnMultiplicationWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculatorFactory = CalculatorFactory()
        
        let result = calculatorFactory.processCalcul(left: 1, operand: "*", right: 1)
        
        XCTAssertEqual(result, "1")
    }
    
    // Division
    
    func testGivenACalculatorFactory_WhenPressEqualAfterAnDivisionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
       
        let calculatorFactory = CalculatorFactory()
        
        let result = calculatorFactory.processCalcul(left: 1, operand: "/", right: 1)
        
        XCTAssertEqual(result, "1")
    }
    
    func testGivenACalculatorFactory_WhenprocessCalcult_ThenReturnIsNil_IsCorrectlyReturned() {
        
        let calculatorFactory = CalculatorFactory()
        
        let result = calculatorFactory.processCalcul(left: 8, operand: "j", right: 2)
        
        XCTAssertNil(result)
    }
}
