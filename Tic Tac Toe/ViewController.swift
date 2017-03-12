//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ryan Smith on 3/7/17.
//  Copyright © 2017 Ryan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var endGameMessage: UILabel!
    @IBOutlet weak var playAgainButon: UIButton!
    
    var activeGame = true
    
    // 1 is crosses & 2 is noughts
    var activePlayer = 1
    
    // 0 = empty, 1 = crosses, 2 = noughts
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
        
            if activePlayer == 1 {
        
                sender.setImage(UIImage(named: "cross.png"), for: [])
                gameState[activePosition] = activePlayer
                activePlayer = 2
                
       
            } else {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                gameState[activePosition] = activePlayer
                activePlayer = 1
                
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    
                    if gameState[combination[0]] == 1 {
                        endGameMessage.text = "X Wins!!"
                    }else if gameState[combination[0]] == 2 {
                        endGameMessage.text = "O Wins!!"
                    }
                    
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.endGameMessage.alpha = 1
                        self.playAgainButon.alpha = 1
                    })
                    
                    
                    
                }
            }
        }
        
    }
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        activePlayer = 1
        endGameMessage.alpha = 0
        playAgainButon.alpha = 0
        
        
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        endGameMessage.alpha = 0
        playAgainButon.alpha = 0
        
    }



}

