//
//  Helper.swift
//  CountOnMe
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

final class Helper {

    /// Convert the String element to an Int and return it
    /// - Parameter firstCharacter: First component String element
    func convertFirstElementIntoInt(firstCharacter: String) -> Int? {
        guard let left = Int(firstCharacter) else { return nil }
        return left
    }

    /// Convert the String element to an Int return it
    /// - Parameter lastCharacter: Last component String element
    func convertLastElementIntoInt(lastCharacter: String) -> Int? {
        guard let right = Int(lastCharacter) else { return nil }
        return right
    }

    /// Return an Int index if it is smaller than count
    /// - Parameters:
    ///   - index: Pressed index
    ///   - count: Count of the operator or operand board
    func validateIndex(index: Int, count: Int) -> Int? {
        guard index < count else { return nil }
        return index
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
