//
//  SetupGame.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 28/01/2020.
//  Copyright © 2020 Jaypeeff. All rights reserved.
//

import UIKit
import UIAlphaNumeric

extension InvadersViewController {
    
       func setControls(){
           //Set up gesture recognizers for the controls
           let leftButtonGesture = UILongPressGestureRecognizer(target: self, action: #selector(leftPressed))
           leftButtonGesture.minimumPressDuration = 0
           leftButtonGesture.allowableMovement = 0
           leftButtonGesture.delegate = self
           leftButton?.addGestureRecognizer(leftButtonGesture)
           
           let rightButtonGesture = UILongPressGestureRecognizer(target: self, action: #selector(rightPressed))
           rightButtonGesture.minimumPressDuration = 0
           rightButtonGesture.allowableMovement = 0
           rightButtonGesture.delegate = self
           rightButton?.addGestureRecognizer(rightButtonGesture)
           
           let leftButtonTap = UITapGestureRecognizer(target: self, action: #selector(leftTapped))
           leftButtonTap.delegate = self
           leftButton?.addGestureRecognizer(leftButtonTap)
           
           let rightButtonTap = UITapGestureRecognizer(target: self, action: #selector(rightTapped))
           rightButtonTap.delegate = self
           rightButton?.addGestureRecognizer(rightButtonTap)
           
           
           
           let fireGesture = UITapGestureRecognizer(target: self, action: #selector(fire))
           fireGesture.numberOfTapsRequired = 1
           fireButton?.addGestureRecognizer(fireGesture)
           
           //Set the control layers
           leftButton?.clipsToBounds = true
           rightButton?.clipsToBounds = true
           leftButton?.layer.masksToBounds = true
           rightButton?.layer.masksToBounds = true
           leftButton?.layer.shouldRasterize = true
           rightButton?.layer.shouldRasterize = true
           
           
           
           if #available(iOS 11.0, *) {
               leftButton?.layer.cornerRadius = (leftButton?.frame.height)! / 2
               leftButton?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
           } else {
               //leftButton?.roundCorners(corners:[.topLeft,.bottomLeft], radius: (leftButton?.frame.height)! / 2)
               
               let path = UIBezierPath(roundedRect: leftButton!.bounds, byRoundingCorners: [.topLeft,.bottomLeft], cornerRadii: CGSize(width: (leftButton?.frame.width)! , height: (leftButton?.frame.height)! ))
               
               let maskLayer = CAShapeLayer()
               maskLayer.path = path.cgPath
               leftButton?.layer.mask = maskLayer
           }
           if #available(iOS 11.0, *) {
               rightButton?.layer.cornerRadius = (rightButton?.frame.height)! / 2
               rightButton?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
           } else {
               //rightButton?.roundCorners(corners:[.topRight,.bottomRight], radius: (rightButton?.frame.height)! / 2)
               
               let path = UIBezierPath(roundedRect: rightButton!.bounds, byRoundingCorners: [.topRight,.bottomRight], cornerRadii: CGSize(width: (rightButton?.frame.width)! , height: (rightButton?.frame.height)!))
               
               let maskLayer = CAShapeLayer()
               maskLayer.path = path.cgPath
               rightButton?.layer.mask = maskLayer
           }
           
           fireButton?.layer.borderWidth = 5
           fireButton?.layer.borderColor = UIColor.white.cgColor
           leftButton?.layer.borderWidth = 5
           leftButton?.layer.borderColor = UIColor.white.cgColor
           rightButton?.layer.borderWidth = 5
           rightButton?.layer.borderColor = UIColor.white.cgColor
           fireButton?.layer.cornerRadius = (fireButton?.frame.height)! / 2
           leftButton?.layer.setNeedsLayout()
       }
    
    
    
    func setScore() {
        let scoreString = String(format: "%06d", model.score)
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        scoreView = alpha.getStringView(string: scoreString, size: (scoreBox?.frame.size)!, fcol: .white, bcol: .red)
        scoreBox?.addSubview(scoreView.charView!)
        
    }
    
    func updateScore() {
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        let scoreString = String(format: "%06d", model.score)
        for (index, char) in scoreString.enumerated() {
            alpha.updateChar(char: char, viewArray: scoreView.charViewArray[index], fcol: .white, bcol: .red)
        }
    }
    
    func setLevel() {
        if levelView != nil {
            levelView?.removeFromSuperview()
        }
        let levelString = "LEVEL\(model.level)"
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        let lv = alpha.getStringView(string: levelString, size: (levelBox?.frame.size)!, fcol: .white, bcol: .red)
        levelView = lv.charView
        levelBox?.addSubview(levelView!)
    }
    
    func setLives() {
        if livesView != nil {
            livesView?.removeFromSuperview()
        }
        let levelString = "Lives\(model.lives)"
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        let lv = alpha.getStringView(string: levelString, size: (livesBox?.frame.size)!, fcol: .white, bcol: .red)
        livesView = lv.charView
        livesBox?.addSubview(livesView!)
    }
    
    func setStars() {
        let w = Int(self.view.frame.width)
        let h = Int((baseLine?.frame.minY)!)
        for _ in 1...500 {
            let x = Int.random(in: 0...w)
            let y = Int.random(in: 0...h)
            let star = UIView(frame: CGRect(x: x, y: y, width: 1, height: 1))
            star.backgroundColor = .white
            self.view.addSubview(star)
        }
    }
    
    func setSilos() {
        let sy = baseLineY - siloBaseLine
        let sx = self.view.frame.width / 6
        for i in 1...3 {
            let s = Silo(pos: CGPoint(x: sx * CGFloat(i*2) - (sx) - 40, y: sy), height: siloHeight, width: siloWidth)
            self.view.addSubview(s.spriteView!)
            silos.append(s)
        }
    }
    
    func setBase() {
        if let base = base {
            base.spriteView?.removeFromSuperview()
        }
        model.leftMove = 0
        model.rightMove = 0
        base = Base(pos: CGPoint(x: 150, y: baseLineY), height: 30, width: 45)
        if let base = base {
            base.position = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height)
            base.spriteView?.alpha = 0
            base.spriteView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.view.addSubview((base.spriteView)!)
            base.animate()
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                base.spriteView?.transform = CGAffineTransform(scaleX: 1, y: 1)
                base.spriteView?.alpha = 1
                base.spriteView?.center = CGPoint(x: self.view.frame.width / 2, y: self.baseLineY)
            }, completion: { (finished: Bool) in
                self.model.gameState = .playing
                base.position = CGPoint(x: self.view.frame.width / 2, y: self.baseLineY)
            })
        }
    }
    
    
    func setInvaders() {
        invaders.removeAll()
        var invaderType = 0

        var delay:Double = 0.0
        let step = viewWidth / 6
        let levelPos = model.level < 5 ? model.level * invaderLevelIncrease : 100
        for i in stride(from: step, to: step * 6, by: step) {
            invaderType = 0
            for z in stride(from: invaderStartY + levelPos, to: invaderStartY + 300 + levelPos, by: 60){
                let invader:Invader = Invader(pos: CGPoint(x: viewWidth / 2, y: 20), height: invaderSize, width: invaderSize,invaderType: invaderType)
                model.numInvaders += 1
                invader.spriteView?.alpha = 0
                invader.spriteView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.view.addSubview(invader.spriteView!)
                invaders.append(invader)
                invader.animate()
                UIView.animate(withDuration: 1.0, delay: delay, options: [], animations: {
                    invader.spriteView?.transform = CGAffineTransform(scaleX: 1, y: 1)
                    invader.spriteView?.alpha = 1
                    invader.spriteView?.center = CGPoint(x: i, y: CGFloat(z))
                    invader.position = CGPoint(x: i, y: CGFloat(z))
                }, completion: { (finished: Bool) in
                })
                delay += 0.020
                invaderType += 1
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.model.gameState = .playing
            self.invaderSound()
        }
    }
    

    
}
