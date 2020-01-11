//
//  Helper.swift
//  CountOnMe
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

final class Helper {

    /// Return an Int index if it is smaller than count
    /// - Parameters:
    ///   - index: Pressed index
    ///   - count: Count of the operator or operand board
    func validateIndex(index: Int, count: Int) -> Int? {
        guard index < count else { return nil }
        return index
    }
    
    func operatorIndex(operationsToReduce: String) -> String.Index? {
        guard let operatorIndex = operationsToReduce.firstIndex(where: { $0 == "*" || $0 == "/"}) else { return nil }
        return operatorIndex
    }

    /// Return the first component String
    /// - Parameter text: The temporaryText String
    func validateFirstElement(in text: String) -> String? {
        guard let firstCharacter = text
            .components(separatedBy: .whitespaces)
            .first else { return nil }
        return firstCharacter.description
    }

    /// Return the last joined component String
    /// - Parameter text: The temporaryText String
    func validateLastJoinedElement(in text: String) -> String? {
        guard let lastCharacter = text
            .components(separatedBy: .whitespaces)
            .joined()
            .last else { return nil }
        return lastCharacter.description
    }

    /// Return the last component String
    /// - Parameter text: The temporaryText String
    func validateLastElement(in text: String) -> String? {
        guard let lastCharacter = text
            .components(separatedBy: .whitespaces)
            .last else { return nil }
        return lastCharacter.description
    }
}
