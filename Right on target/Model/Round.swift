//
//  Round.swift
//  Right on target
//
//  Created by TeRb1 on 24.05.2022.
//

import Foundation

protocol RoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    
    func calculateScore(withValue: Int)
}

class Round: RoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    
    init(currentSecretValue: Int) {
        self.currentSecretValue = currentSecretValue
    }
    
    
    func calculateScore(withValue value: Int) {
        if value > currentSecretValue {
            self.score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            self.score += 50 - currentSecretValue + value
        } else {
            self.score += 50
        }
    }
    
    
}
