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

class ViewModel {

    // MARK: - Private Properties

    private let operators: [String] = ["+", "-", "*", "/", "="]
    
    private let operands: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

    private var temporaryText: String = "" {
        didSet {
            let text = temporaryText.components(separatedBy: .whitespaces)
            print(text)
            displayedText?(text.joined(separator: " "))
        }
    }
    
    // MARK: - Outputs
    
    var displayedText: ((String) -> Void)?

    var navigateTo: ((NextScreen) -> Void)?

    enum NextScreen {
        case alert(alertConfiguration: AlertConfiguration)
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        temporaryText = ""
    }

    let helper = Helper()
    
    func didPressOperator(at index: Int) {
        guard index < operators.count else { return }
        let `operator` = operators[index]
    
        if let text = helper.validateLastElement(in: temporaryText) {
            operatorsSetting(lastCharacter: text, operator: `operator`)
        }
    }
    
    

    func didPressOperand(with index: Int) {
        guard let firstElement = temporaryText.components(separatedBy: .whitespaces).first else { return }
        guard let lastElement = helper.validateLastElement(in: temporaryText) else { return }

        guard firstElement.count <= 9 || lastElement.count <= 9 else { return }
        
        guard index < operands.count else { return }
        let operand = operands[index]

        operandsSettings(operand: operand)
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
        
//        if let firstCharacter = helper.validateFirstElement(in: temporaryText), let lastCharacter = helper.validateLastElement(in: temporaryText) {
//            
//            let left = Int(firstCharacter)!
//            
//            guard let operationsToReduceFirstIndex = operationsToReduce.firstIndex(of: firstCharacter) else { return }
//            let operandIndex = operationsToReduce.index(after: operationsToReduceFirstIndex)
//            let operand = operationsToReduce[operandIndex]
//            
//            let right = Int(lastCharacter)!
//            
//            result(left: left, operand: operand, right: right, operationsToReduce: operationsToReduce)
//        }
        
        guard
            let firstCharacter = operationsToReduce
                .first,
                let left = Int(firstCharacter)
            else { return }
            
        guard let operationsToReduceFirstIndex = operationsToReduce.firstIndex(of: firstCharacter) else { return }
        let operandIndex = operationsToReduce.index(after: operationsToReduceFirstIndex)
        let operand = operationsToReduce[operandIndex]

        guard
            let lastElement = operationsToReduce.last,
            let right = Int(lastElement)
            else { return }

        result(left: left, operand: operand, right: right, operationsToReduce: operationsToReduce)
    }
    
    private let calculatorFactory = CalculatorFactory()
    
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
