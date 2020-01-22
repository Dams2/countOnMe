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
//        if operators.contains(lastCharacter) {
//           alertFor(multipleOperators: true, divisionByZero: false)
//           return
//        } else if `operator` == "=" {
//            calcul()
//        } else if `operator` != "="{
//            temporaryText += " \(`operator`) "
//        }
        
         temporaryText += " \(`operator`) "

        if temporaryText.components(separatedBy: .whitespaces).contains("=") {
            calcul()
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
    
    private func calcul() {
        var operationsToReduce = temporaryText.components(separatedBy: .whitespaces)
        
        repeat {
            guard let operatorIndex = operationsToReduce.firstIndex(where: { $0 == "*" || $0 == "/"}) else { return }
            let beforeIndex = operationsToReduce.index(before: operatorIndex)
            let afterIndex = operationsToReduce.index(after: operatorIndex)
            guard let firstElement = Int(operationsToReduce[beforeIndex]) else { return }
            let operatorElement = operationsToReduce[operatorIndex]
            guard let secondElement = Int(operationsToReduce[afterIndex]) else { return }
                        
    
            if let result = calculatorFactory.processCalcul(left: firstElement, operand: operatorElement, right: secondElement) {

                print("eekwdljflkwjndaslfhjsadlkhjfdlkjsahlkfjshlkfhslkjhfdsalkjhfsklhdsha")

                operationsToReduce.insert(result, at: beforeIndex)
                print(operationsToReduce)
                print("21837981782379717391389")

                operationsToReduce.removeSubrange(beforeIndex+1...afterIndex+1)
                print("jsadnkjnfdkjwan")
                print(operationsToReduce)
                
            }
        } while operationsToReduce.contains("*") || operationsToReduce.contains("/")
        
        print("---------------------------------------------------------")

        repeat {
            print("kwmdlfma")
            guard let operatorIndex = operationsToReduce.firstIndex(where: { $0 == "+" || $0 == "-"}) else { return }
            print("11")
            let beforeIndex = operationsToReduce.index(before: operatorIndex)
            let afterIndex = operationsToReduce.index(after: operatorIndex)
            guard let firstElement = Int(operationsToReduce[beforeIndex]) else { return }
            let operatorElement = operationsToReduce[operatorIndex]
            guard let secondElement = Int(operationsToReduce[afterIndex]) else { return }
                
            if let result = calculatorFactory.processCalcul(left: firstElement, operand: operatorElement, right: secondElement) {
                print("\n\njsadnkjnfdkjwan")
                print(operationsToReduce)
                operationsToReduce.insert(result, at: beforeIndex)
                print("\n\n1982371298743927498312798371982749837891327983791728473298321")
                print(operationsToReduce)
                operationsToReduce.removeSubrange(beforeIndex+1...afterIndex+1)
                print("\n\nsdakpoKéLKaélklkaFJéLKKJASFJKHADSKJHFKJDSHAKLJHSDFKJHDASKJHKSDH")
                print(operationsToReduce)
            }
            
        } while operationsToReduce.count >= 3
        
        operationsToReduce.removeLast()
        print(operationsToReduce)
        print("---------------------------------------------------------")
        temporaryText = ""
        print(temporaryText)
        print("sdlé,awélm,élfa----------")
    
        temporaryText = "\(operationsToReduce)"
        print(temporaryText)
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
