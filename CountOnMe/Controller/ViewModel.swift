//
//  ViewModel.swift
//  CountOnMe
//
//  Created by Damien Rojo on 11/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

struct AlertConfiguration: Equatable {
    let title: String
    let message: String
    let okTitle: String
}

final class ViewModel {

    // MARK: - Private Properties

    private let operators: [String] = ["+", "-", "*", "/", "="]

    private let operands: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    private let helper = Helper()

    private let calculatorFactory = Calculator()

    private var temporaryText: String = "" {
        didSet {
            let text = temporaryText.components(separatedBy: .whitespaces)
            print(text)
            displayedText?(text.joined(separator: " "))
        }
    }

    // MARK: - Outputs
    
    /// Return the text to be displayed
    var displayedText: ((String) -> Void)?

    /// Return the screen to be displayed
    var navigateTo: ((NextScreen) -> Void)?

    /// Handle the list of screen which can be displayed
    enum NextScreen {
        case alert(alertConfiguration: AlertConfiguration)
    }

    // MARK: - Inputs
    
    /// Handle the view did load event
    func viewDidLoad() {
        temporaryText = ""
    }
    
    /// Handle the event when an operator is pressed
    /// - Parameter index: The index of the pressed operator.
    func didPressOperator(at index: Int) {
        if let validateIndex = helper.validateIndex(index: index, count: operators.count) {
            let `operator` = operators[validateIndex]
          
            if let text = helper.validateLastJoinedElement(in: temporaryText) {
                operatorsSetting(lastCharacter: text, operator: `operator`)
            }
        }
    }
    
    /// Handle the event when an operand is pressed
    /// - Parameter index: The index of the pressed operand.
    func didPressOperand(with index: Int) {
        if let firstElement = helper.validateFirstElement(in: temporaryText), let lastElement = helper.validateLastElement(in: temporaryText) {
            if firstElement.count <= 9 || lastElement.count <= 9 {
                if let validateIndex = helper.validateIndex(index: index, count: operands.count) {
                    let operand = operands[validateIndex]
                    operandsSettings(operand: operand)
                }
            }
        }
    }

    func didPressAc() {
       temporaryText = ""
    }

    // MARK: - Private functions

    private func operatorsSetting(lastCharacter: String, operator: String) {
        if operators.contains(lastCharacter) {
           alertFor(multipleOperators: true, divisionByZero: false)
           return
        } else if `operator` == "=" {
            processCalcul(operationsToReduce: temporaryText.components(separatedBy: .whitespaces))
        } else {
            processCalculIfYouAddAnotherOperator(operator: `operator`)
        }
    }

    private func alertFor(multipleOperators: Bool, divisionByZero: Bool) {
        if multipleOperators == true {
            self.navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "Attention", message: "Interdiction de mettre 2 opérateurs à la suite", okTitle: "D'accord")))
        }
        if divisionByZero == true {
            self.navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "Attention", message: "Interdiction de diviser par Zero !", okTitle: "D'accord")))
        }
    }

    private func processCalcul(operationsToReduce: [String]) {
        if operationsToReduce.count == 3 {
            if let firstCharacter = helper.validateFirstElement(in: temporaryText), let lastCharacter = helper.validateLastElement(in: temporaryText) {
                
                if let left = helper.convertFirstElementIntoInt(firstCharacter: firstCharacter), let right = helper.convertLastElementIntoInt(lastCharacter: lastCharacter) {

                    if let operationsToReduceFirstIndex = operationsToReduce.firstIndex(of: firstCharacter) {
                        let operandIndex = operationsToReduce.index(after: operationsToReduceFirstIndex)
                        let operand = operationsToReduce[operandIndex]
                        result(left: left, operand: operand, right: right, operationsToReduce: operationsToReduce)
                    }
                }
            }
        }
    }

    private func result(left: Int, operand: String, right: Int, operationsToReduce: [String]) {

        var operationsToReduce = operationsToReduce

        while operationsToReduce.count > 1 {
            if let result = calculatorFactory.processCalcul(left: left, operand: operand, right: right) {
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
            }
        }
        if let operationToReduceFirst = operationsToReduce.first {
            temporaryText = "\(operationToReduceFirst)"
        }
    }

    private func processCalculIfYouAddAnotherOperator(operator: String) {
        let commonElements = operators.filter { temporaryText.components(separatedBy: .whitespaces).contains($0) }

        if !commonElements.isEmpty {
            processCalcul(operationsToReduce: temporaryText.components(separatedBy: .whitespaces))
            temporaryText += " \(`operator`) "
            return
       } else {
            temporaryText += " \(`operator`) "
        }
    }

    private func operandsSettings(operand: Int) {
        if temporaryText.components(separatedBy: .whitespaces).joined().last == "/" && operand == 0 {
            alertFor(multipleOperators: false, divisionByZero: true)
            return
        } else {
            temporaryText += "\(operand)"
        }
    }
}

extension ViewModel.NextScreen: Equatable {
    public static func ==(lhs: ViewModel.NextScreen, rhs: ViewModel.NextScreen) -> Bool {
        switch (lhs, rhs) {
        case let (.alert(c1), .alert(c2)):
            return c1 == c2
        }
    }
}
