//
//  ViewController.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit

class InvadersViewController: UIViewController {
    
    @IBOutlet weak var leftButton: UIView?
    @IBOutlet weak var rightButton: UIView?
    @IBOutlet weak var fireButton: UIView?
    @IBOutlet weak var baseLine: UIView?
    @IBOutlet weak var coverView: UIView?
    @IBOutlet weak var scoreBox: UIView?
    @IBOutlet weak var levelBox: UIView?
    @IBOutlet weak var livesBox: UIView?
    
    var introView:UIView?
    var gameoverView:UIView?
    var levelView:UIView?
    var livesView:UIView?
    
    var model:InvadersModel = InvadersModel()
    var base:Base?
    var motherShip:MotherShip?
    var baseLineY: CGFloat = 0
    var viewWidth: CGFloat = 0
    var viewHeight: CGFloat = 0
    var bullet:Bullet?
    var invaders:[Invader] = []
    var bombs:[Bomb] = []
    var silos:[Silo] = []
    var soundFX:SoundFX = SoundFX()
    var scoreView:StringViewArray = StringViewArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the model
        model.viewController = self
        self.view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setControls()
        setScore()
        setLevel()
        setLives()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.bringSubviewToFront(coverView!)
        let displayLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(refreshDisplay))
        displayLink.add(to: .main, forMode:.common)
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        if !model.layoutSet { // only want to do this once.
            model.layoutSet = true
            baseLineY = ((baseLine?.center.y)!) - 15
            viewWidth = self.view.frame.width
            viewHeight = self.view.frame.height
            setStars()
            setIntro()
        }
    }
    
    fileprivate func setControls(){
        //Set up gesture recognizers for the controls
        let leftButtonGesture = UILongPressGestureRecognizer(target: self, action: #selector(leftPressed))
        leftButtonGesture.minimumPressDuration = 0
        leftButtonGesture.allowableMovement = 0
        leftButton?.addGestureRecognizer(leftButtonGesture)
        
        let rightButtonGesture = UILongPressGestureRecognizer(target: self, action: #selector(rightPressed))
        rightButtonGesture.minimumPressDuration = 0
        rightButtonGesture.allowableMovement = 0
        rightButton?.addGestureRecognizer(rightButtonGesture)
        
        let fireGesture = UITapGestureRecognizer(target: self, action: #selector(fire))
        fireGesture.numberOfTapsRequired = 1
        fireButton?.addGestureRecognizer(fireGesture)
        
        //Set the control layers
        fireButton?.layer.cornerRadius = (fireButton?.frame.height)! / 2
        leftButton?.roundCorners(corners:[.topLeft,.bottomLeft], radius: (leftButton?.frame.height)! / 2)
        rightButton?.roundCorners(corners:[.topRight,.bottomRight], radius: (rightButton?.frame.height)! / 2)
    }
    
    fileprivate func setIntro(){
        introView = UIView(frame: CGRect(x: 0, y: 0, width: (coverView?.frame.width)!, height: (coverView?.frame.height)!))
        
        if let introView = introView, let coverView = coverView {
            let w = coverView.frame.width
            let h = coverView.frame.height
            coverView.backgroundColor = UIColor.black.withAlphaComponent(0.10)
            coverView.addSubview(introView)
            introView.backgroundColor = .clear
            let alpha:AlphaNumeric = AlphaNumeric()
            
            let title = UIView(frame: CGRect(x: 0, y: 20, width: w, height: 90))
            title.addSubview(alpha.get(string: "UIVIEW", size: (title.frame.size), fcol: .orange, bcol:.green ))
            title.backgroundColor = .clear
            introView.addSubview(title)
            
            let subTitle = UIView(frame: CGRect(x: 0, y: 130, width: w, height: 60))
            subTitle.addSubview(alpha.get(string: "INVADERS", size: (subTitle.frame.size), fcol: .green, bcol:.red ))
            subTitle.backgroundColor = .clear
            introView.addSubview(subTitle)
            
            let subTitle2 = UIView(frame: CGRect(x: 20, y: h-100, width: w - 40, height: 30))
            subTitle2.addSubview(alpha.get(string: "PRESS FIRE", size: (subTitle2.frame.size), fcol: .red, bcol:.yellow ))
            subTitle2.backgroundColor = .clear
            introView.addSubview(subTitle2)
            
            let subTitle3 = UIView(frame: CGRect(x: 20, y: h - 60, width: w - 40, height: 30))
            subTitle3.addSubview(alpha.get(string: "TO START", size: (subTitle3.frame.size), fcol: .red, bcol:.yellow ))
            subTitle3.backgroundColor = .clear
            introView.addSubview(subTitle3)
            introView.layoutIfNeeded()
            
        }
        setIntroInvaders()
        self.view.bringSubviewToFront(coverView!)
    }
    
    fileprivate func setGameOverView(){
        for b in bombs {
            b.spriteView?.removeFromSuperview()
        }
        let alpha:AlphaNumeric = AlphaNumeric()
        gameoverView = UIView(frame: CGRect(x: 0, y: viewHeight / 2, width: (coverView?.frame.width)!, height: 40))
        let gov = UIView(frame: CGRect(x: 0, y: 0, width: (gameoverView?.frame.width)!, height: (gameoverView?.frame.height)!))
        gov.addSubview(alpha.get(string: "GAME OVER", size: (gov.frame.size), fcol: .red, bcol:.yellow ))
        gov.backgroundColor = .clear
        gameoverView!.alpha = 0
        gameoverView!.addSubview(gov)
        gameoverView!.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: CGFloat.pi)
        self.view.addSubview(gameoverView!)
        UIView.animate(withDuration: 0.5, delay: 0.25, options: [], animations: {
            self.gameoverView!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0).rotated(by: 0)
            self.gameoverView!.alpha = 1
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 0.5, delay: 3.0, options: [], animations: {
                self.gameoverView!.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: CGFloat.pi)
                self.gameoverView!.alpha = 0
            }, completion: { (finished: Bool) in
                self.coverView!.alpha = 1
                self.model.gameState = .starting
                self.gameoverView!.removeFromSuperview()
                self.setIntro()
            })            
        })
    }
    
    fileprivate func resetGame() {
        setGameOverView()
        for i in invaders {
            if let isv = i.spriteView {
                isv.removeFromSuperview()
            }
        }
        invaders.removeAll()
        
        for s in silos {
            if let ssv = s.spriteView {
                ssv.removeFromSuperview()
            }
        }
        silos.removeAll()
        
        for b in bombs {
            if let bsv = b.spriteView {
                bsv.removeFromSuperview()
            }
        }
        bombs.removeAll()
        
        base?.spriteView?.removeFromSuperview()
        base = nil
        
        if let msv = motherShip?.spriteView {
            msv.removeFromSuperview()
            motherShip = nil
        }
    }
    
    fileprivate func nextLevel() {
        model.gameState = .loading
        for s in silos {
            if let ssv = s.spriteView {
                ssv.removeFromSuperview()
            }
        }
        silos.removeAll()
        //No silos after level 5
        if model.level < 5 {
            setSilos()
        }
        setInvaders()
    }
    
    fileprivate func cleanUpBeforeNextLevel(){
        for b in bombs {
            if let bsv = b.spriteView {
                bsv.removeFromSuperview()
            }
        }
        bombs.removeAll()
        if motherShip != nil {
            motherShip?.spriteView?.removeFromSuperview()
            motherShip = nil
        }
    }
    
    fileprivate func startGame() {
        self.removeIntroInvaders()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.coverView!.alpha = 0
        }, completion: { (finished: Bool) in
            self.introView?.removeFromSuperview()
            self.model.reset()
            self.setSilos()
            self.setInvaders()
            self.setBase()
        })
    }
    
    fileprivate func setScore() {
        let scoreString = String(format: "%06d", model.score)
        let alpha:AlphaNumeric = AlphaNumeric()
        scoreView = alpha.getStringView(string: scoreString, size: (scoreBox?.frame.size)!, fcol: .white, bcol: .red)
        scoreBox?.addSubview(scoreView.charView!)
        
    }
    
    func updateScore() {
        let alpha:AlphaNumeric = AlphaNumeric()
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
        let alpha:AlphaNumeric = AlphaNumeric()
        let lv = alpha.getStringView(string: levelString, size: (levelBox?.frame.size)!, fcol: .white, bcol: .red)
        levelView = lv.charView
        levelBox?.addSubview(levelView!)
    }
    
    func setLives() {
        if livesView != nil {
            livesView?.removeFromSuperview()
        }
        let levelString = "Lives\(model.lives)"
        let alpha:AlphaNumeric = AlphaNumeric()
        let lv = alpha.getStringView(string: levelString, size: (livesBox?.frame.size)!, fcol: .white, bcol: .red)
        livesView = lv.charView
        livesBox?.addSubview(livesView!)
    }
    
    fileprivate func setStars() {
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
    
    fileprivate func setSilos() {
        let sy = baseLineY - 120
        let sx = self.view.frame.width / 6
        for i in 1...3 {
            let s = Silo(pos: CGPoint(x: sx * CGFloat(i*2) - (sx) - 40, y: sy), height: 60, width: 80)
            self.view.addSubview(s.spriteView!)
            silos.append(s)
        }
    }
    
    fileprivate func setBase() {
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
    
    fileprivate func setIntroInvaders() {
        
        let step = viewWidth / 6
        for i in stride(from: step, to: step * 6, by: step) {
            for z in stride(from: 300, to: 600, by: 60){
                let invader:Invader = Invader(pos: CGPoint(x: viewWidth / 2, y: 20), height: 40, width: 40)
                invader.spriteView?.alpha = 0
                invader.spriteView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.view.addSubview(invader.spriteView!)
                invaders.append(invader)
                invader.animate()
                UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                    invader.spriteView?.transform = CGAffineTransform(scaleX: 1, y: 1)
                    invader.spriteView?.alpha = 1
                    invader.spriteView?.center = CGPoint(x: i, y: CGFloat(z))
                    invader.position = CGPoint(x: i, y: CGFloat(z))
                }, completion: { (finished: Bool) in
                })
            }
        }
    }
    
    fileprivate func removeIntroInvaders(){
        for invader in invaders {
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                invader.spriteView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                invader.spriteView?.alpha = 1
                invader.spriteView?.center = CGPoint(x: self.viewWidth / 2, y: 20)
            }, completion: { (finished: Bool) in
                invader.spriteView?.removeFromSuperview()
            })
        }
    }
    
    fileprivate func setInvaders() {
        invaders.removeAll()
        var delay:Double = 0.0
        let step = viewWidth / 6
        let levelPos = model.level < 5 ? model.level * 20 : 100
        for i in stride(from: step, to: step * 6, by: step) {
            for z in stride(from: 100 + levelPos, to: 400 + levelPos, by: 60){
                let invader:Invader = Invader(pos: CGPoint(x: viewWidth / 2, y: 20), height: 40, width: 40)
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
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.model.gameState = .playing
            self.invaderSound()
        }
    }
    
    func invaderSound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.soundFX.invaderSound()
            if self.model.gameState == .playing || self.model.gameState == .loading || self.model.gameState == .starting {
                self.invaderSound()
            }
        }
    }
    
    fileprivate func checkMothership()
    {
        let yPos = (scoreBox?.center.y)! + 30
        if motherShip == nil {
            // random add a new mothership
            if Int.random(in: 0...300) == 1 {
                motherShip = MotherShip(pos: CGPoint(x: self.view.frame.width + 10, y: yPos), height: 30, width: 45)
                self.view.addSubview(motherShip!.spriteView!)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.motherSound()
                }
                motherShip?.animate()
            }
        } else {
            let x = (motherShip?.position.x)!
            if x < -20 {
                motherShip?.spriteView?.removeFromSuperview()
                motherShip = nil
            } else {
                motherShip?.position = CGPoint(x: x - 1, y: yPos)
            }
        }
    }
    
    fileprivate func motherSound(){
        self.soundFX.motherSound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if self.motherShip != nil {
                if !(self.motherShip?.isDead)! {
                    self.motherSound()
                }
            }
        }
    }
    
    fileprivate func moveBase() {
        if let base = base {
            let x = base.position.x
            let y = base.position.y
            if model.leftMove > 0 && x > 0 {
                base.position = CGPoint(x: x - model.baseSpeed, y: y)
            } else if model.rightMove > 0 && x < self.view.frame.width {
                base.position = CGPoint(x: x + model.baseSpeed, y: y)
            }
        }
    }
    
    fileprivate func checkBullets() {
        if model.bulletFired {
            if let bullet = bullet, let spriteView = bullet.spriteView {
                let pos = bullet.position
                if pos.y <= 0 {
                    model.bulletFired = false
                    bullet.spriteView?.removeFromSuperview()
                } else {
                    bullet.position = CGPoint(x: pos.x, y: pos.y - 8)
                    for inv in invaders {
                        if inv.checkHit(pos: spriteView.center) == true {
                            self.soundFX.hitSound()
                            spriteView.removeFromSuperview()
                            model.bulletFired = false
                            model.score += 10
                            model.deadCount += 1
                        }
                    }
                }
                
                for s in silos {
                    if (s.checkHit(pos:bullet.position)) {
                        spriteView.removeFromSuperview()
                        model.bulletFired = false
                    }
                }
                
                if motherShip != nil {
                    if motherShip!.checkHit(pos:spriteView.center) == true {
                        soundFX.hitSound()
                        spriteView.removeFromSuperview()
                        model.bulletFired = false
                        model.score += 100
                    }
                }
            }
        }
    }
    
    fileprivate func checkBombs() {
        for bomb in bombs {
            if bomb.isDying || bomb.isDead {continue}
            
            if bomb.position.y > baseLineY {
                bomb.isDying = true
                continue
            }
            bomb.move(x: 0, y: model.bombSpeed)
            if model.gameState == .playing {
                if let b = base {
                    if b.checkHit(pos:bomb.position) {
                        bomb.isDying = true
                        model.gameState = .ending
                        self.soundFX.baseHitSound()
                        self.model.lives -= 1
                        if self.model.lives == 0 {
                            self.model.gameState = .gameOver
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            //self.model.lives -= 1
                            if self.model.lives == 0 {
                                //self.model.gameState = .gameOver
                                self.resetGame()
                                
                            } else {
                                self.setBase()
                            }
                        }
                        continue
                    }
                }
            }
            for s in silos {
                if (s.checkHit(pos:bomb.position)) {
                    bomb.isDying = true
                }
            }
        }
    }
    
    fileprivate func checkIntroInvaders(){
        for inv in invaders {
            // rotate the odd one
            if Int.random(in: 0...1000) == 1 {
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                    inv.spriteView!.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }, completion: nil)
                UIView.animate(withDuration: 0.5, delay: 0.25, options: [], animations: {
                    inv.spriteView!.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                }, completion: nil)
            }
            
            if model.invaderXSpeed > 0 {
                if inv.position.x > viewWidth - 10 {
                    model.invaderXSpeed = -2
                }
            } else {
                if inv.position.x < 10 {
                    model.invaderXSpeed = 2
                }
            }
        }
    }
    
    fileprivate func checkInvaders() {
        for inv in invaders {
            if inv.isDead {continue}
            if Int.random(in: 0...model.bombRandomiser) == 1 && model.gameState == .playing {
                dropBomb(pos: inv.position)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                    inv.spriteView!.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }, completion: nil)
                UIView.animate(withDuration: 0.5, delay: 0.25, options: [], animations: {
                    inv.spriteView!.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                }, completion: nil)
            }
            // use the amount of dead invaders to increase the speed of the remaining
            // so the game gets harder.
            
            if model.invaderXSpeed > 0 {
                if inv.position.x > viewWidth - 10 {
                    model.invaderXSpeed = -2 - (model.deadCount / 6)
                    model.invaderYSpeed = 5 + (model.deadCount / 6)
                    break
                }
            } else {
                if inv.position.x < 10 {
                    model.invaderXSpeed = 2 + (model.deadCount / 6)
                    model.invaderYSpeed = 5 + (model.deadCount / 6)
                    break
                }
            }
            if model.gameState != .ending {
                if let b = base, let i = inv.spriteView {
                    if i.frame.minY > baseLineY - 40 {
                        model.gameState = .ending
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            //game over They've landed
                            self.model.gameState = .gameOver
                            self.resetGame()
                        }
                        break
                    }
                    if b.checkHit(pos: (i.frame)) {
                        model.gameState = .ending
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            //game over sunshine!
                            self.soundFX.baseHitSound()
                            self.model.gameState = .gameOver
                            self.resetGame()
                        }
                        break
                    }
                }
            }
            for s in silos {
                if let isv = inv.spriteView {
                    if (s.checkHit(pos: isv.frame)) {
                        //do nothing as invaders just wipe up the silo and thats in the checkhit function
                    }
                }
            }
        }
    }

    func moveInvaders() {
        for inv in invaders {
            if inv.isDead {continue}
            inv.move(x: model.invaderXSpeed, y: model.invaderYSpeed)
        }
        if model.invaderYSpeed > 0 { model.invaderYSpeed = 0}
    }
    
    @objc func refreshDisplay() {
        
        switch model.gameState {
        case .starting:
            moveInvaders()
            checkIntroInvaders()
            break
        case .loading:
            break
        case.nextLevel:
            self.model.gameState = .loading
            cleanUpBeforeNextLevel()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.nextLevel()
            }
            break
        case .ending:
            checkBullets()
            checkBombs()
            checkInvaders()
            moveInvaders()
            checkMothership()
            break
        case .playing:
            moveBase()
            moveInvaders()
            checkBullets()
            checkInvaders()
            checkBombs()
            checkMothership()
            break
        case .gameOver:
            break
        case .hiScore:
            break
        }
    }
    
    @objc func leftPressed(gesture:UILongPressGestureRecognizer) {
        guard model.gameState == .playing else {
            return
        }
        if gesture.state == .began {
            model.leftMove = model.baseSpeed
        } else if gesture.state == .ended {
            model.leftMove = 0
        }
        
    }
    
    @objc func rightPressed(gesture:UILongPressGestureRecognizer) {
        guard model.gameState == .playing else {
            return
        }
        if gesture.state == .began {
            model.rightMove = model.baseSpeed
        } else if gesture.state == .ended {
            model.rightMove = 0
        }
    }
    
    @objc func fire(gesture:UITapGestureRecognizer) {
        guard model.bulletFired == false && model.gameState != .loading else {
            return
        }
        
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        
        if model.gameState == .starting || model.gameState == .gameOver {
            model.gameState = .loading
            startGame()
        } else if model.gameState != .ending {
            if let bsv = base?.spriteView {
                bullet = Bullet(pos: bsv.center, height: 24, width: 8)
                bullet?.position = bsv.center
                self.view.addSubview(bullet!.spriteView!)
                model.bulletFired = true
                soundFX.shootSound()
            }
        }
    }
    
    func dropBomb(pos:CGPoint) {
        guard model.gameState == .playing else {
            return
        }
        let bomb = Bomb(pos: pos, height: 24, width: 8)
        bomb.position = pos
        self.view.addSubview(bomb.spriteView!)
        bombs.append(bomb)
        bomb.startAnimating()
    }
    
}

