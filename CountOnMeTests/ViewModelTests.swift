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

//    func testGivenAViewModel_WhenViewDidLoad_ThenAdditionText_IsCorrectlyReturned() {
//        let viewModel = ViewModel()
//        let expectation = self.expectation(description: "Addition text returned")
//
//        viewModel.additionText = { text in
//            XCTAssertEqual(text, " + ")
//            expectation.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func testGivenAViewModel_WhenViewDidLoad_ThenSubtractionText_IsCorrectlyReturned() {
//        let viewModel = ViewModel()
//        let expectation = self.expectation(description: "Subtraction text returned")
//
//        viewModel.subtractionText = { text in
//            XCTAssertEqual(text, " - ")
//            expectation.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func testGivenAViewModel_WhenViewDidLoad_ThenMultiplicationText_IsCorrectlyReturned() {
//        let viewModel = ViewModel()
//        let expectation = self.expectation(description: "Multiplication text returned")
//
//        viewModel.multiplicationText = { text in
//            XCTAssertEqual(text, " x ")
//            expectation.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func testGivenAViewModel_WhenViewDidLoad_ThenDivisionText_IsCorrectlyReturned() {
//        let viewModel = ViewModel()
//        let expectation = self.expectation(description: "Division text returned")
//
//        viewModel.divisionText = { text in
//            XCTAssertEqual(text, " ÷ ")
//            expectation.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func testGivenAViewModel_WhenViewDidLoad_ThenAcText_IsCorrectlyReturned() {
//        let viewModel = ViewModel()
//        let expectation = self.expectation(description: "AC text returned")
//
//        viewModel.acText = { text in
//            XCTAssertEqual(text, " A/C ")
//            expectation.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }
//
//    func testGivenAViewModel_WhenViewDidLoad_ThenEqualText_IsCorrectlyReturned() {
//        let viewModel = ViewModel()
//        let expectation = self.expectation(description: "Equal text returned")
//
//        viewModel.equalText = { text in
//            XCTAssertEqual(text, " = ")
//            expectation.fulfill()
//        }
//        viewModel.viewDidLoad()
//        waitForExpectations(timeout: 1.0, handler: nil)
//    }

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
            if counter == 5 {
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
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex1_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "1 + 1 = 2")
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

    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex2_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "2 + 2 = 4")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex3_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "3 + 3 = 6")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex4_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "4 + 4 = 8")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex5_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "5 + 5 = 10")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex6_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "6 + 6 = 12")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex7_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "7 + 7 = 14")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex8_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "8 + 8 = 16")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnAdditionWithIndex9_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "9 + 9 = 18")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 0)
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // MARK: - Substraction
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
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
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex1_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "1 - 1 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex2_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "2 - 2 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex3_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "3 - 3 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex4_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "4 - 4 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex5_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "5 - 5 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex6_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "6 - 6 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex7_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "7 - 7 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex8_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "8 - 8 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnSubtractionWithIndex9_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "9 - 9 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 1)
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // MARK: - Substraction
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
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
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex1_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "1 * 1 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 1)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex2_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "2 * 2 = 4")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex3_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "3 * 3 = 9")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex4_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "4 * 4 = 16")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex5_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "5 * 5 = 25")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex6_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "6 * 6 = 36")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex7_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "7 * 7 = 49")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex8_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "8 * 8 = 64")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnMultiplicationWithIndex9_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "9 * 9 = 81")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 2)
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // MARK: - Division
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex0_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "0 / 0 = 0")
                  expectation.fulfill()
            }
            counter += 1
        }

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
            if counter == 5 {
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

    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex2_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "2 / 2 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 2)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex3_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "3 / 3 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 3)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex4_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "4 / 4 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 4)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex5_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "5 / 5 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 5)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex6_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "6 / 6 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 6)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex7_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "7 / 7 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 7)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex8_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "8 / 8 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 8)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testGivenAViewModel_WhenPressEqualAfterAnDivisionWithIndex9_ThenDisplayedText_IsCorrectlyReturned() {
        let viewModel = ViewModel()
        let expectation = self.expectation(description: "Addition text returned")
        
        var counter = 0
        viewModel.displayedText = { text in
            if counter == 5 {
                  XCTAssertEqual(text, "9 / 9 = 1")
                  expectation.fulfill()
            }
            counter += 1
        }

        viewModel.viewDidLoad()
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 3)
        viewModel.didPressOperand(with: 9)
        viewModel.didPressOperator(at: 4)

        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
