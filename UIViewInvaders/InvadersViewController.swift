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
    var bullet:Bullet?
    var invaders:[Invader] = []
    var bombs:[Bomb] = []
    var silos:[Silo] = []
    
    var scoreView:StringViewArray = StringViewArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the model
        model.viewController = self
        model.setSounds()
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
        if !model.layoutSet {
            model.layoutSet = true
            baseLineY = ((baseLine?.center.y)!) - 15
            
            setIntro()
            setStars()
            setSilos()
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
            coverView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            coverView.addSubview(introView)
            introView.backgroundColor = .clear
            let alpha:AlphaNumeric = AlphaNumeric()
            
            let title = UIView(frame: CGRect(x: 0, y: 50, width: w, height: 90))
            title.addSubview(alpha.get(string: "UIVIEW", size: (title.frame.size), fcol: .red, bcol:.white ))
            title.backgroundColor = .clear
            introView.addSubview(title)
            
            let subTitle = UIView(frame: CGRect(x: 0, y: 170, width: w, height: 60))
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
    }
    
    fileprivate func setGameOverView(){
        gameoverView = UIView(frame: CGRect(x: 0, y: 0, width: (coverView?.frame.width)!, height: (coverView?.frame.height)!))
        if let gameoverView = gameoverView, let coverView = coverView {
            self.view.bringSubviewToFront(coverView)
            coverView.alpha = 1.0
            let w = coverView.frame.width
            let h = coverView.frame.height
            coverView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            coverView.addSubview(gameoverView)
            gameoverView.backgroundColor = .clear
            
            let alpha:AlphaNumeric = AlphaNumeric()
            coverView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            let title = UIView(frame: CGRect(x: 0, y: 50, width: w, height: 90))
            title.addSubview(alpha.get(string: "UIVIEW", size: (title.frame.size), fcol: .red, bcol:.white ))
            title.backgroundColor = .clear
            gameoverView.addSubview(title)
            let subTitle = UIView(frame: CGRect(x: 0, y: 170, width: w, height: 60))
            subTitle.addSubview(alpha.get(string: "INVADERS", size: (subTitle.frame.size), fcol: .green, bcol:.red ))
            subTitle.backgroundColor = .clear
            gameoverView.addSubview(subTitle)
            
            let subTitle2 = UIView(frame: CGRect(x: 20, y: h-100, width: w - 40, height: 30))
            subTitle2.addSubview(alpha.get(string: "PRESS FIRE", size: (subTitle2.frame.size), fcol: .red, bcol:.yellow ))
            subTitle2.backgroundColor = .clear
            gameoverView.addSubview(subTitle2)
            
            let subTitle3 = UIView(frame: CGRect(x: 20, y: h - 60, width: w - 40, height: 30))
            subTitle3.addSubview(alpha.get(string: "TO START", size: (subTitle3.frame.size), fcol: .red, bcol:.yellow ))
            subTitle3.backgroundColor = .clear
            gameoverView.addSubview(subTitle3)
            let subTitle4 = UIView(frame: CGRect(x: 20, y: h / 2, width: w - 40, height: 30))
            subTitle4.addSubview(alpha.get(string: "GAME OVER", size: (subTitle4.frame.size), fcol: .red, bcol:.yellow ))
            subTitle4.backgroundColor = .clear
            gameoverView.addSubview(subTitle4)
        }
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
        setSilos()
        
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
        self.view.bringSubviewToFront(coverView!)
        model.gameState = .loading
        print(model.gameState)
    }
    
    fileprivate func nextLevel() {
        //self.view.bringSubviewToFront(coverView!)
        //model.reset()
        
        model.gameState = .loading
        invaders.removeAll()
        
        for s in silos {
            if let ssv = s.spriteView {
                ssv.removeFromSuperview()
            }
        }
        silos.removeAll()
        //No silos after level 4
        if model.level < 4 {
            setSilos()
        }
        

        
        setInvaders()
    }
    
    fileprivate func cleanUpBeforeNextLevel(){
        print("Bombs dropped \(bombs.count)")
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
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.coverView!.alpha = 0
        }, completion: { (finished: Bool) in
            self.introView?.removeFromSuperview()
            self.model.reset()
            //self.updateScore()
            self.setInvaders()
            self.setBase()
        })
    }
    
    func setScore() {
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
        print("sy = \(sy)")
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
        //        baseLineY = ((baseLine?.center.y)!) - 15
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
    
    
    fileprivate func setInvaders() {
        
        let viewWidth = self.view.frame.width
        let step = viewWidth / 6
        let levelPos = model.level < 5 ? model.level * 10 : 50
        
        for i in stride(from: step, to: step * 6, by: step) {
            for z in stride(from: 100 + levelPos, to: 400 + levelPos, by: 60){
                let invader:Invader = Invader(pos: CGPoint(x: viewWidth / 2, y: 20), height: 40, width: 40)
                model.numInvaders += 1
                invader.spriteView?.alpha = 0
                invader.spriteView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.view.addSubview(invader.spriteView!)
                invaders.append(invader)
                invader.animate()
                //                let d = Double(model.numInvaders / 10)
                UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                    invader.spriteView?.transform = CGAffineTransform(scaleX: 1, y: 1)
                    invader.spriteView?.alpha = 1
                    invader.spriteView?.center = CGPoint(x: i, y: CGFloat(z))
                    invader.position = CGPoint(x: i, y: CGFloat(z))
                }, completion: { (finished: Bool) in
                })
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.model.gameState = .playing
            self.invaderSound()
        }
    }
    
    func invaderSound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.model.invaderSound()
            if self.model.gameState == .playing || self.model.gameState == .loading || self.model.gameState == .starting {
                self.invaderSound()
            }
        }
    }
    
    
    fileprivate func checkMothership()
    {
        let yPos = (scoreBox?.center.y)! + 30
        
        if motherShip == nil {
            
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
        self.model.motherSound()
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
                            self.model.hitSound()
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
                        model.hitSound()
                        spriteView.removeFromSuperview()
                        model.bulletFired = false
                        model.score += 100
                    }
                }
            }
        }
    }
    
    fileprivate func checkBombs() {
        for (index,bomb) in bombs.enumerated() {
            if bomb.isDying || bomb.isDead {continue}
            
            if bomb.position.y > baseLineY {
                bomb.isDying = true
                //                if index > bombs.count {
                //                    bombs.remove(at: index)
                //                }
                continue
            }
            bomb.move(x: 0, y: model.bombSpeed)
            if model.gameState == .playing {
                if let b = base {
                    if b.checkHit(pos:bomb.position) {
                        bomb.isDying = true
                        //                        if index > bombs.count {
                        //                            bombs.remove(at: index)
                        //                        }
                        model.gameState = .ending
                        self.model.baseHitSound()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.model.lives -= 1
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
                    //                    if index < bombs.count {
                    //                        bombs.remove(at: index)
                    //                    }
                }
            }
        }
    }
    
    fileprivate func checkInvaders() {
        for inv in invaders {
            if inv.isDead {continue}
            if Int.random(in: 0...1000) == 1 && model.gameState == .playing {
                dropBomb(pos: inv.position)
            }
            if model.invaderXSpeed > 0 {
                if inv.position.x > self.view.frame.width - 10 {
                    model.invaderXSpeed = -2 - (model.deadCount / 8)
                    model.invaderYSpeed = 5
                    break
                }
            } else {
                if inv.position.x < 10 {
                    model.invaderXSpeed = 2 + (model.deadCount / 8)
                    model.invaderYSpeed = 5
                    break
                }
            }
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
                        self.model.baseHitSound()
                        self.model.gameState = .gameOver
                        self.resetGame()
                    }
                    break
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
    
    @objc func refreshDisplay() {
        
        switch model.gameState {
        case .starting:
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
            checkBullets()
            checkInvaders()
            moveInvaders()
            checkBombs()
            checkMothership()
            break
        case .gameOver:
            break
        case .hiScore:
            break
        }
    }
    
    func moveInvaders() {
        for inv in invaders {
            if inv.isDead {continue}
            inv.move(x: model.invaderXSpeed, y: model.invaderYSpeed)
        }
        
        if model.invaderYSpeed > 0 { model.invaderYSpeed = 0}
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
        print(model.gameState)
        guard model.bulletFired == false && model.gameState != .starting else {
            return
        }
        
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        
        if model.gameState == .loading || model.gameState == .gameOver {
            model.gameState = .starting
            startGame()
        } else {
            if let bsv = base?.spriteView {
                bullet = Bullet(pos: bsv.center, height: 24, width: 8)
                bullet?.position = bsv.center
                self.view.addSubview(bullet!.spriteView!)
                model.bulletFired = true
                model.shootSound()
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

