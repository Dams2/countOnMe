//
//  ViewModel.swift
//  CountOnMe
//
//  Created by Damien Rojo on 11/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class ViewModel {

    // MARK: - Private Properties

    private let operators: [String] = ["+", "-", "*", "/", "="]
    
    private let operands: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    // MARK: - Outputs
    
    var displayedText: ((String) -> Void)?
    var additionText: ((String) -> Void)?
    var subtractionText: ((String) -> Void)?
    var multiplicationText: ((String) -> Void)?
    var divisionText: ((String) -> Void)?
    var acText: ((String) -> Void)?
    var equalText: ((String) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        self.displayedText?("")
        self.additionText?(" + ")
        self.subtractionText?(" - ")
        self.multiplicationText?(" x ")
        self.divisionText?(" ÷ ")
        self.acText?(" A/C ")
        self.equalText?(" = ")
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
