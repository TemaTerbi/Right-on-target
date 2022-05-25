//
//  ViewController.swift
//  Right on target
//
//  Created by TeRb1 on 24.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    
    var gameModel: Game!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View didLoad")
        
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        gameModel = Game(valueGenerator: generator, rounds: 5)
        
        gameModel.startNewRound()
        updateLable(newText: String(gameModel.currentRound.currentSecretValue))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func checkNumber(sender: UIButton) {
        
        let currentValue = Int(self.slider.value)
        gameModel.currentRound.calculateScore(withValue: currentValue)
        
        if gameModel.isGameEnd {
            showAlert(withScore: gameModel.score)
            gameModel.restartGame()
        } else {
            gameModel.startNewRound()
        }
        
        updateLable(newText: String(gameModel.currentRound.currentSecretValue))
    }
    
    private func updateLable (newText: String) {
        self.label.text = newText
    }
    
    private func showAlert (withScore: Int) {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Ваше колличество очков \(withScore)",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true,  completion: nil )
    }
    
    


}

