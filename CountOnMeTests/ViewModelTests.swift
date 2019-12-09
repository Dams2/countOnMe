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
    
    func testGivenAViewModel_WhenPressEqual_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Press equal text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "2")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenDidPressOperand_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "first and last element count less than 9")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 21 {
                  XCTAssertEqual(text, "1111111111 + 1111111111")
                  expectation.fulfill()
            }
            counter += 1
        }
        
        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        
        viewModel.didPressOperator(at: 0)
        
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperand(with: 1)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenAViewModel_WhenPressOperatorInsteadOfEqual_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Press operator instead of equal text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "2")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 0)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Division by zero text returned")
        let alertExpectation = self.expectation(description: "Returned alert")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 2 {
                XCTAssertEqual(text, "0 / ")
                expectation.fulfill()
            }
            
            counter += 1
        }

        let expectedConfiguration = AlertConfiguration(title: "Attention",
                                                       message: "Interdiction de diviser par Zero !",
                                                       okTitle: "D'accord")
        viewModel.navigateTo = { screen in
            XCTAssertEqual(screen, ViewModel.NextScreen.alert(alertConfiguration: expectedConfiguration))
            alertExpectation.fulfill()
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 0)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPress2TimeAnOperator_ThenDisplayedTextAndAlertConfiguration_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Double operator text returned")
        let alertExpectation = self.expectation(description: "Returned alert")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 2 {
                XCTAssertEqual(text, "1 / ")
                expectation.fulfill()
            }
            
            counter += 1
        }
        
        let expectedConfiguration = AlertConfiguration(title: "Attention",
                                                       message: "Interdiction de mettre 2 opérateurs à la suite",
                                                       okTitle: "D'accord")
        viewModel.navigateTo = { screen in
            XCTAssertEqual(screen, ViewModel.NextScreen.alert(alertConfiguration: expectedConfiguration))
            alertExpectation.fulfill()
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperator(at: 4)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
