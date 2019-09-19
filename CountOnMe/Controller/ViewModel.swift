//
//  ViewModel.swift
//  CountOnMe
//
//  Created by Damien Rojo on 11/09/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

class ViewModel {
    
    // MARK: - Outputs
    
    var textViewText: ((String) -> Void)?
    var additionButtonText: ((String) -> Void)?
    var subtractionButtonText: ((String) -> Void)?
    var multiplicationButtonText: ((String) -> Void)?
    var divisionButtonText: ((String) -> Void)?
    var acButtonText: ((String) -> Void)?
    var equalButtonText: ((String) -> Void)?
    
    // MARK: - Inputs
    
    func viewDidLoad() {
        self.textViewText?("")
        self.additionButtonText?(" + ")
        self.subtractionButtonText?(" - ")
        self.multiplicationButtonText?(" x ")
        self.divisionButtonText?(" ÷ ")
        self.acButtonText?(" A/C ")
        self.equalButtonText?(" = ")
    }
    
    func didPressNumberButton() {
    }
    
    func didPressAdditionButton() {
        self.textViewText?(" + ")
    }
    
    func didPressSubstractionButton() {
        self.textViewText?(" - ")
    }
    
    func didPressMultiplicationButton() {
        self.textViewText?(" x ")
    }
    
    func didPressDivisionButton() {
        self.textViewText?(" ÷ ")
    }
    
    func didPressAcButton() {
        self.textViewText?("")
    }
    
    func didPressEqualButton() {
    }
    
}
