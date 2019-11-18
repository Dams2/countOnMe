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
    
    // MARK: - Additions
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "0 + 0 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // MARK: - Substraction
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "0 - 0 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // MARK: - Multiplication
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "0 * 0 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // MARK: - Division
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        let alertExpectation = self.expectation(description: "Returned alert")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                XCTAssertEqual(text, "0")
                expectation.fulfill()
                
            }
            counter += 1
        }

        let expectedConfiguration = AlertConfiguration(title: "Attention",
                                                       message: "Division par zéro interdite",
                                                       okTitle: "ok")
        viewModel.navigateTo = { screen in
            XCTAssertEqual(screen, ViewModel.NextScreen.alert(alertConfiguration: expectedConfiguration))
            alertExpectation.fulfill()
        }

        // TODO handle error there

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 0)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex1_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "1 / 1 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPress2TimeAnOperator_ThenDisplayedTextAndAlertConfiguration_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        let alertExpectation = self.expectation(description: "Returned alert")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 4 {
                  XCTAssertEqual(text, "0")
                  expectation.fulfill()
            }
            counter += 1
        }
        
        let expectedConfiguration = AlertConfiguration(title: "Attention",
                                                       message: "Interdiction de mettre 2 opérateurs à la suite",
                                                       okTitle: "ok")
        viewModel.navigateTo = { screen in
            XCTAssertEqual(screen, ViewModel.NextScreen.alert(alertConfiguration: expectedConfiguration))
            alertExpectation.fulfill()
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
