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
            let text = temporaryText
                .split(separator: " ")
                .map { "\($0)" }
                .joined()
            displayedText?(text)
        }
    }
    
    private var expressionHaveEnoughElement: Bool {
        return temporaryText.count >= 3
    }
    
    private var expressionIsCorrect: Bool {
        guard let lastCharacter = temporaryText.last else { return false }
        return !operators.contains(lastCharacter.description)
    }
    
    private var expressionHaveResult: Bool {
        return temporaryText.firstIndex(of: "=") != nil
    }
    
    // MARK: - Outputs
    
    var displayedText: ((String) -> Void)?

    var navigateTo: ((NextScreen) -> Void)?

    enum NextScreen {
        case alert(alertConfiguration: AlertConfiguration)
    }
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        self.displayedText?("")
    }

    func didPressOperator(at index: Int) {
        guard index < operators.count else { return }
        let `operator` = operators[index]
        
        if `operator` != "=" {
            if expressionIsCorrect {
                temporaryText.append(`operator`)
            } else {
                navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "", message: "", okTitle: "")))
            }
        } else {
             guard expressionIsCorrect else {
                navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "", message: "", okTitle: "")))
            }
            
            guard expressionHaveEnoughElement else {
                 navigateTo?(.alert(alertConfiguration: AlertConfiguration(title: "", message: "", okTitle: "")))
            }
            
            var operationsToReduce = temporaryText
            
            while operationsToReduce.count > 1 {
                let u = Int(operationsToReduce[operationsToReduce.startIndex].description)
                let left = Int(operationsToReduce[0])!
                let operand = operationsToReduce[1]
                let right = Int(operationsToReduce[2])!
                
                let result: Int
                
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                case "*": result = left * right
                case "/": result = left / right
                default: fatalError("Unknown operator !")
                }
                
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
            }
            temporaryText.append(`operator`)
            displayedText?(temporaryText)
        }
    }

    func didPressOperand(with index: Int) {
        guard index < operands.count else { return }
        let operand = operands[index]
        if expressionHaveResult {
            displayedText?("")
            
        }
        displayedText?(String(operand))
    }
    
    func didPressAc() {
        self.displayedText?("")
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
