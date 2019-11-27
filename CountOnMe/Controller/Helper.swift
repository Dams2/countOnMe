//
//  Helper.swift
//  CountOnMe
//
//  Created by Damien Rojo on 27.11.19.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import Foundation

final class Helper {
    
    
    
    func validateFirstElement(in text: String) -> String? {
        guard let lastCharacter = text
            .components(separatedBy: .whitespaces)
            .first else { return nil }
        return lastCharacter.description
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
