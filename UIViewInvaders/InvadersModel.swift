//
//  InvadersModel.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 22/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit
import AVFoundation

enum GameState {
    case starting
    case loading
    case playing
    case nextLevel
    case dieing
    case ending
    case gameOver
    case hiScore
}

final class InvadersModel {
    weak var viewController:InvadersViewController?
    var layoutSet: Bool = false
    var bulletFired: Bool = false
    var gameState:GameState = .starting
    var bombRandomiser:Int = 1000
    
    var lives:Int = 3 {
        didSet{
            viewController?.setLives()
        }
    }
    var level:Int = 1 {
        didSet{
//            guard gameState != .loading else {
//                return
//            }
            viewController?.setLevel()
        }
    }
    var deadCount:Int = 0 {
        didSet{
            guard gameState != .loading else {
                return
            }
            bombRandomiser -= 10
            if bombRandomiser < 100 { bombRandomiser = 100 }
            
            if deadCount == numInvaders {
                nextLevel()
            }
        }
    }
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
    var numInvaders:Int = 0
    
    // reset the game
    func reset() {
        self.gameState = .loading
        self.invaderXSpeed = 2
        self.invaderYSpeed = 0
        self.bombSpeed = 4
        self.deadCount = 0
        self.lives = 3
        self.score = 0
        self.level = 1
        self.numInvaders = 0
        self.bombRandomiser = 1000
    }
    // set up model for next level
    // after level 5 it stays the same.
    func nextLevel() {
        self.gameState = .nextLevel
        self.invaderXSpeed = 2
        self.invaderYSpeed = 0
        self.bombSpeed = 4
        self.deadCount = 0
        self.lives += 1
        self.score += 1000
        self.level += 1
        self.numInvaders = 0
        self.bombRandomiser = level < 5 ? 1000 - (level * 100) : 500
    }
    
}
