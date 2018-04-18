//
//  LSNameGenerator.swift
//  light_shot
//
//  Created by Benjamin Pisano on 18/04/2018.
//  Copyright © 2018 Snopia. All rights reserved.
//

import Foundation

class LSNameGenerator {
    
    private let availableCharacters = "abcdefghijklmnopqrstuvwxyz0123456789"
    
    func generate(len: Int, _ completion: (_ name: String) -> Void) {
        let characterCount = availableCharacters.count
        var name = Array(repeating: 0, count: len)
        var index = 0
        
        completion(nameFrom(array: name))
        while index < len {
            if name[index] < characterCount - 1 {
                name[index] += 1
                index = 0
                completion(nameFrom(array: name))
            } else {
                name[index] = 0
                index += 1
            }
        }
    }
    
    private func nameFrom(array: Array<Int>) -> String {
        var name = String()
        
        for letter in array {
            name.append(availableCharacters.charAt(letter))
        }
        return name
    }
}
