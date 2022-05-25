//
//  ColorGenerator.swift
//  Right on target
//
//  Created by TeRb1 on 25.05.2022.
//

import Foundation

protocol ColorGeneratorProtocol {
    func generateRandomNumber() -> Int
}

class ColorGenerator: ColorGeneratorProtocol {
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

