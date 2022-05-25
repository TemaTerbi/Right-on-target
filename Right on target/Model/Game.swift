//
//  Game.swift
//  Right on target
//
//  Created by TeRb1 on 24.05.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    
    var currentRound: RoundProtocol! { get }
    
    var isGameEnd: Bool { get }
    
    var secretValueGenerator: GeneratorProtocol { get }
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentRound: RoundProtocol!
    private var rounds: [RoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    
    var isGameEnd: Bool {
        if roundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = Round(currentSecretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.generateRandomNumber()
    }
    
    
    
    
}
