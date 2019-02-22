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

class InvadersModel {
    weak var viewController:InvadersViewController?
    
    var gameState:GameState = .loading
    var lives:Int = 3
    var score:Int = 0 {
        didSet{
            viewController?.updateScore()
        }
    }
    
}
