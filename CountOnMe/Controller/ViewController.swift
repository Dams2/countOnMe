//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var textView: UITextView!

    // MARK: - Private properties

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
            if case .alert(alertConfiguration: let configuration) = screen {
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

    @IBAction private func pressOperator(_ sender: UIButton) {
        let index = sender.tag
        viewModel.didPressOperator(at: index)
    }

    @IBAction private func pressOperand(_ sender: UIButton) {
        let index = sender.tag
        viewModel.didPressOperand(with: index)
    }

    @IBAction private func pressClear(_ sender: UIButton) {
        viewModel.didPressAc()
    }
}
