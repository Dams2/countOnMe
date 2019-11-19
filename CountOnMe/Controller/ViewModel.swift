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

    func didPressOperator(at index: Int) {
        guard index < operators.count else { return }
        let `operator` = operators[index]
    
        guard let lastCharacter = temporaryText
            .components(separatedBy: .whitespaces)
            .joined()
            .last else { return }
        
        if operators.contains(lastCharacter.description) {
            self.navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "Attention", message: "Interdiction de mettre 2 opérateurs à la suite", okTitle: "D'accord")))
            return
        }
        if `operator` == "=" {
            processCalcul(operationsToReduce: temporaryText.components(separatedBy: .whitespaces))
        } else if temporaryText.components(separatedBy: .whitespaces).contains(operators[0]) ||
            temporaryText.components(separatedBy: .whitespaces).contains(operators[1]) ||
            temporaryText.components(separatedBy: .whitespaces).contains(operators[2]) ||
            temporaryText.components(separatedBy: .whitespaces).contains(operators[3]) {
            processCalcul(operationsToReduce: temporaryText.components(separatedBy: .whitespaces))
            temporaryText += " \(`operator`) "
            return
        } else {
            temporaryText += " \(`operator`) "
        }
    }

    func didPressOperand(with index: Int) {
        ///////////////////////////////
        guard temporaryText.count <= 9 else { return }
        //////////////////////////////
        guard index < operands.count else { return }
        let operand = operands[index]
        if temporaryText.last?.description == "/" && operand == 0 {
            self.navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "Attention", message: "Interdiction de diviser par Zero !", okTitle: "D'accord")))
            return
        } else {
            temporaryText += "\(operand)"
        }
    }

    func didPressAc() {
       temporaryText = ""
    }

    // MARK: - Private func

    private func processCalcul(operationsToReduce: [String]) {

            guard
                let firstElement = operationsToReduce.first,
                let left = Int(firstElement)
                else { return }
            
            guard let operationsToReduceFirstIndex = operationsToReduce.firstIndex(of: firstElement.description) else { return }
            let operandIndex = operationsToReduce.index(after: operationsToReduceFirstIndex)
            let operand = operationsToReduce[operandIndex]
            
            guard
                let lastElement = operationsToReduce.last,
                let right = Int(lastElement)
                else { return }

        result(left: left, operand: operand, right: right, operationsToReduce: operationsToReduce)
    }

    private func result(left: Int, operand: String, right: Int, operationsToReduce: [String]) {
        
        var operationsToReduce = operationsToReduce
        
        
        while operationsToReduce.count > 1 {
            
            let result: Int
            switch operand.description {
            case "+": result = left + right
            case "-": result = left - right
            case "*": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        
        guard let operationToReduceFirst = operationsToReduce.first else { return }
        temporaryText = "\(operationToReduceFirst)"
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
