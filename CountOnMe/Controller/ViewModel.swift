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

        guard let lastCharacter = temporaryText.last else { return }
        guard !operators.contains(lastCharacter.description) else { return }

        if `operator` == "=" {
            processCalcul()
        } else {
            temporaryText += " \(`operator`) "
        }
    }

    func didPressOperand(with index: Int) {
        guard index < operands.count else { return }
        let operand = operands[index]
        temporaryText += "\(operand)"
    }
    
    func didPressAc() {
       temporaryText = ""
    }

    // MARK: - Private func

    private func processCalcul() {

        var operationsToReduce = temporaryText.components(separatedBy: .whitespaces)

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {

            guard
                let firstElement = operationsToReduce.first,
                let left = Int(firstElement)
                else { return }
            
            let operandIndex = operationsToReduce.index(after: operationsToReduce.firstIndex(of: firstElement.description)!)
            let operand = operationsToReduce[operandIndex]
            
            guard
                let lastElement = operationsToReduce.last,
                let right = Int(lastElement)
                else { return }

            let result: Int
            switch operand.description {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "÷": result = left / right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }

        temporaryText.append(" = \(operationsToReduce.first!)")
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
