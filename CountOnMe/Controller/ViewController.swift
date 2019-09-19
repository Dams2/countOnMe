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

    @IBOutlet weak var additionButton: UIButton! 
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    // MARK: - Private properties
    
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

        viewModel.textViewText = { [weak self] text in
            self?.textView.text = text
        }

        viewModel.additionButtonText = { [weak self] text in
            self?.additionButton.setTitle(text, for: .normal)
        }

        viewModel.subtractionButtonText = { [weak self] text in
            self?.subtractionButton.setTitle(text, for: .normal)
        }

        viewModel.multiplicationButtonText = { [weak self] text in
            self?.multiplicationButton.setTitle(text, for: .normal)
        }

        viewModel.divisionButtonText = { [weak self] text in
            self?.divisionButton.setTitle(text, for: .normal)
        }
        
        viewModel.acButtonText = { [weak self] text in
            self?.acButton.setTitle(text, for: .normal)
        }

        viewModel.equalButtonText = { [weak self] text in
            self?.equalButton.setTitle(text, for: .normal)
        }
    }

    // MARK: - Helpers

    func anOperatorIsAlreadyPut() {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }

        if expressionHaveResult {
            viewModel.didPressNumberButton()
        }

        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator {
            guard let additionTitleLabel = additionButton.titleLabel?.text else {
                return
            }
            
            textView.text.append(additionTitleLabel)
            
        } else {
            anOperatorIsAlreadyPut()
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if canAddOperator {
            guard let subtractionTitleLabel = subtractionButton.titleLabel?.text else {
                return
            }
            
            textView.text.append(subtractionTitleLabel)
            
        } else {
            anOperatorIsAlreadyPut()
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if canAddOperator {
            guard let multiplicationTitleLabel = multiplicationButton.titleLabel?.text else {
                return
            }

            textView.text.append(multiplicationTitleLabel)

        } else {
            anOperatorIsAlreadyPut()
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if canAddOperator {
            guard let subtractionTitleLabel = subtractionButton.titleLabel?.text else {
                return
            }

            textView.text.append(subtractionTitleLabel)

        } else {
            anOperatorIsAlreadyPut()
        }
    }
    
    @IBAction func tappedAcButton(_ sender: UIButton) {
        viewModel.didPressAcButton()
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
