//
//  CalculatorFactory.swift
//  CountOnMe
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

final class CalculatorFactory {
    
    
    
    func processCalcul(left: Int, operand: String, right: Int) -> String? {
        switch operand {
        case "+": return "\(left + right)"
        case "-": return "\(left - right)"
        case "*": return "\(left * right)"
        case "/": return "\(left / right)"
        default: return nil
        }
    }
}
