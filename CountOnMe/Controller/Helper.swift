//
//  Helper.swift
//  CountOnMe
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

final class Helper {
    
    func convertFirstElementIntoInt(firstCharacter: String) -> Int? {
        guard let left = Int(firstCharacter) else { return nil }
        return left
    }
    
    func convertLastElementIntoInt(lastCharacter: String) -> Int? {
        guard let right = Int(lastCharacter) else { return nil }
        return right
    }
    
    func validateIndex(index: Int, count: Int) -> Int? {
        guard index < count else { return nil }
        return index
    }
    
    func validateFirstElement(in text: String) -> String? {
        guard let firstCharacter = text
            .components(separatedBy: .whitespaces)
            .first else { return nil }
        return firstCharacter.description
    }
    
    func validateLastJoinedElement(in text: String) -> String? {
        guard let lastCharacter = text
            .components(separatedBy: .whitespaces)
            .joined()
            .last else { return nil }
        return lastCharacter.description
    }

    func validateLastElement(in text: String) -> String? {
        guard let lastCharacter = text
            .components(separatedBy: .whitespaces)
            .last else { return nil }
        return lastCharacter.description
    }
}
