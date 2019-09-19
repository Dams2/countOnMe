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
    
    func testGivenAViewModel_WhenViewDidLoad_ThenTextViewText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Text view text returned")
        
        viewModel.textViewText = { text in
            XCTAssertEqual(text, "")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenAdditionButtonText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition button text returned")
        
        viewModel.textViewText = { text in
            XCTAssertEqual(text, " + ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenSubtractionButtonText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Subtraction button text returned")
        
        viewModel.textViewText = { text in
            XCTAssertEqual(text, " - ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenMultiplicationButtonText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Multiplication button text returned")
        
        viewModel.textViewText = { text in
            XCTAssertEqual(text, " x ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenDivisionButtonText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Division button text returned")
        
        viewModel.textViewText = { text in
            XCTAssertEqual(text, " ÷ ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenViewDidLoad_ThenEqualButtonText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Equal button text returned")
        
        viewModel.textViewText = { text in
            XCTAssertEqual(text, " = ")
            expectation.fulfill()
        }
        viewModel.viewDidLoad()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

