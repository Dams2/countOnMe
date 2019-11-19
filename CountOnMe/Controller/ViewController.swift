//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private var numberButtons: [UIButton]!
    @IBOutlet private weak var additionButton: UIButton!
    @IBOutlet private weak var subtractionButton: UIButton!
    @IBOutlet private weak var multiplicationButton: UIButton!
    @IBOutlet private weak var divisionButton: UIButton!
    @IBOutlet private weak var acButton: UIButton!
    @IBOutlet private weak var equalButton: UIButton!
    
    @IBOutlet var operators: [UIButton]!
    
    // MARK: - Private properties
    
    private var size: CGFloat = 60

    private var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }

    private var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }

    private var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    private var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }

    private var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }

    private lazy var viewModel = ViewModel()

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    private func bind(to viewModel: ViewModel) {
        viewModel.displayedText = { [weak self] text in
            self?.textView.text = text
        }

        viewModel.navigateTo = { [weak self] screen in
            switch screen {
            case .alert(alertConfiguration: let configuration):
                self?.displayAlert(with: configuration)
            }
        }
    }
    
    // MARK: - Helpers

    private func displayAlert(with configuration: AlertConfiguration) {
        let alertVC = UIAlertController(title: configuration.title, message: configuration.message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: configuration.okTitle, style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    // MARK: - Action

    @IBAction private func pressOperand(_ sender: UIButton) {
        let index = sender.tag
        viewModel.didPressOperator(at: index)
    }

    @IBAction private func tappedNumberButton(_ sender: UIButton) {
        let index = sender.tag
        viewModel.didPressOperand(with: index)
    }

    @IBAction private func tappedAcButton(_ sender: UIButton) {
        viewModel.didPressAc()
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        // Create local copy of operations
        var operationsToReduce = elements

        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!

            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "÷": result = left / right
            default: fatalError("Unknown operator !")
            }

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }

        textView.text.append(" = \(operationsToReduce.first!)")
    }
}
