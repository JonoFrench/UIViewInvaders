//
//  InvadersModel.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 22/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit

enum GameState {
    case loading
    case starting
    case playing
    case ending
    case gameOver
    case hiScore
}

final class InvadersModel {
    weak var viewController:InvadersViewController?
    var layoutSet: Bool = false
    var bulletFired: Bool = false
    var gameState:GameState = .loading
    
    var lives:Int = 3 {
        didSet{
            viewController?.setLives()
        }
    }
    var level:Int = 0 {
        didSet{
            viewController?.setLevel()
        }
    }
    var deadCount:Int = 0
    var score:Int = 0 {
        didSet{
            viewController?.updateScore()
        }
    }
    var baseSpeed: CGFloat = 2
    var leftMove: CGFloat = 0
    var rightMove: CGFloat = 0
    var invaderXSpeed:Int = 2
    var invaderYSpeed:Int = 0
    var bombSpeed:Int = 4
 
    func reset() {
        self.gameState = .loading
        self.invaderXSpeed = 2
        self.invaderYSpeed = 0
        self.bombSpeed = 4
        self.deadCount = 0
        self.lives = 3
        self.score = 0
        self.level = 0
    }
    
}
