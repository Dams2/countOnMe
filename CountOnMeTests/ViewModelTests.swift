//
//  ViewModelTests.swift
//  CountOnMeTests
//
//  Created by Damien Rojo on 18/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

@testable import CountOnMe
import XCTest

final class ViewModelTests: XCTestCase {
    
    func testGivenAViewModel_WhenViewDidLoad_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Displayed text returned")
        
        viewModel.displayedText = { text in
            XCTAssertEqual(text, "")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenAdditionText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        viewModel.additionText = { text in
            XCTAssertEqual(text, " + ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenSubtractionText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Subtraction text returned")
        
        viewModel.subtractionText = { text in
            XCTAssertEqual(text, " - ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenMultiplicationText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Multiplication text returned")
        
        viewModel.multiplicationText = { text in
            XCTAssertEqual(text, " x ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenDivisionText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Division  text returned")
        
        viewModel.divisionText = { text in
            XCTAssertEqual(text, " ÷ ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenAcText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "AC text returned")
        
        viewModel.acText = { text in
            XCTAssertEqual(text, " A/C ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenEqualText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Equal text returned")
        
        viewModel.equalText = { text in
            XCTAssertEqual(text, " = ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenViewModel_WhenDidPressOperatorAtIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Displayed text returned for index 0")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "+")
                expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        viewModel.didPressOperator(at: 0)
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenViewModel_WhenDidPressAc_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Displayed text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 1 {
                XCTAssertEqual(text, "")
                expectation.fulfill()
            }
            counter += 1
        }
        viewModel.viewDidLoad()
        viewModel.didPressAc()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
