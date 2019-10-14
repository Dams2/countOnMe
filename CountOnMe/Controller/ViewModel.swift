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
        // les calculs a faires plus tard surement?
        displayedText?(`operator`)
        
    }

    func didPressOperand(with index: Int) {
        guard index < operands.count else { return }
        let operand = operands[index]
        // les calculs a faires plus tard surement?
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
