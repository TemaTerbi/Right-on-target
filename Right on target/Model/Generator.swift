//
//  Generator.swift
//  Right on target
//
//  Created by TeRb1 on 24.05.2022.
//

import Foundation

protocol GeneratorProtocol {
    func generateRandomNumber() -> Int
}

class NumberGenerator: GeneratorProtocol {
    private let minValue: Int
    private let maxValue: Int
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        
        minValue = startValue
        maxValue = endValue
    }
    
    func generateRandomNumber() -> Int {
        (minValue...maxValue).randomElement()!
    }
}
