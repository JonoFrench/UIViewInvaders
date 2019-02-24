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
        self.view.layoutIfNeeded()
        introView = UIView(frame: (coverView?.frame)!)

        if let introView = introView, let coverView = coverView {
            coverView.layoutIfNeeded()
            coverView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            coverView.addSubview(introView)
            introView.layoutIfNeeded()
           introView.center = coverView.center
            introView.backgroundColor = .clear
            let alpha:AlphaNumeric = AlphaNumeric()
            print("cover width \(coverView.frame.width) intro width \(introView.frame.width)")
            let w = coverView.frame.width
            let h = coverView.frame.height
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
            print("invaders width \(subTitle.frame.width)")

    }
    }
    
   fileprivate func setGameOver(){
        self.view.layoutIfNeeded()
        let alpha:AlphaNumeric = AlphaNumeric()
        coverView?.layoutIfNeeded()
        coverView?.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        let w = coverView?.frame.width
        let h = coverView?.frame.height
        print("width \(w!)")
        let title = UIView(frame: CGRect(x: 0, y: 50, width: w!, height: 90))
        title.addSubview(alpha.get(string: "UIVIEW", size: (title.frame.size), fcol: .red, bcol:.white ))
        title.backgroundColor = .clear
        coverView?.addSubview(title)
        let subTitle = UIView(frame: CGRect(x: 0, y: 170, width: w!, height: 60))
        subTitle.addSubview(alpha.get(string: "INVADERS", size: (subTitle.frame.size), fcol: .green, bcol:.red ))
        subTitle.backgroundColor = .clear
        coverView?.addSubview(subTitle)
        
        let subTitle2 = UIView(frame: CGRect(x: 20, y: h!-100, width: w! - 40, height: 30))
        subTitle2.addSubview(alpha.get(string: "PRESS FIRE", size: (subTitle2.frame.size), fcol: .red, bcol:.yellow ))
        subTitle2.backgroundColor = .clear
        coverView?.addSubview(subTitle2)
        
        let subTitle3 = UIView(frame: CGRect(x: 20, y: h! - 60, width: w! - 40, height: 30))
        subTitle3.addSubview(alpha.get(string: "TO START", size: (subTitle3.frame.size), fcol: .red, bcol:.yellow ))
        subTitle3.backgroundColor = .clear
        coverView?.addSubview(subTitle3)
        let subTitle4 = UIView(frame: CGRect(x: 20, y: h! / 2, width: w! - 40, height: 30))
        subTitle4.addSubview(alpha.get(string: "GAME OVER", size: (subTitle4.frame.size), fcol: .red, bcol:.yellow ))
        subTitle4.backgroundColor = .clear
        coverView?.addSubview(subTitle4)
    }
    
   fileprivate func resetGame() {
        self.view.bringSubviewToFront(coverView!)
        model.reset()
        
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
    }
    
   fileprivate func startGame() {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.coverView!.alpha = 0
        }, completion: { (finished: Bool) in
            self.introView?.removeFromSuperview()
            self.updateScore()
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
        let sx = self.view.frame.width / 6
        for i in 1...3 {
            let s = Silo(pos: CGPoint(x: sx * CGFloat(i*2) - (sx), y: 600), height: 60, width: 80)
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
        baseLineY = ((baseLine?.center.y)!) - 15
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
        for i in stride(from: step, to: step * 6, by: step) {
            for z in stride(from: 100, to: 400, by: 60){
                let invader:Invader = Invader(pos: CGPoint(x: viewWidth / 2, y: 20), height: 40, width: 40)
                invader.spriteView?.alpha = 0
                invader.spriteView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.view.addSubview(invader.spriteView!)
                invaders.append(invader)
                invader.animate()
                
                UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                    invader.spriteView?.transform = CGAffineTransform(scaleX: 1, y: 1)
                    invader.spriteView?.alpha = 1
                    invader.spriteView?.center = CGPoint(x: i, y: CGFloat(Float(z)))
                }, completion: { (finished: Bool) in
                    invader.position = CGPoint(x: i, y: CGFloat(Float(z)))
                })
                
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.model.gameState = .playing
            
        }
        
    }
    fileprivate func checkMothership()
    {
        let yPos = (scoreBox?.center.y)! + 30
        
        if motherShip == nil {
            
            if Int.random(in: 0...300) == 1 {
                motherShip = MotherShip(pos: CGPoint(x: self.view.frame.width + 10, y: yPos), height: 30, width: 45)
                self.view.addSubview(motherShip!.spriteView!)
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
                            spriteView.removeFromSuperview()
                            model.bulletFired = false
                            model.deadCount += 1
                            model.score += 10
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
                if index > bombs.count {
                    bombs.remove(at: index)
                }
                continue
            }
            bomb.move(x: 0, y: model.bombSpeed)
            if model.gameState == .playing {
                if let b = base {
                    if b.checkHit(pos:bomb.position) {
                        bomb.isDying = true
                        if index > bombs.count {
                            bombs.remove(at: index)
                        }
                        model.gameState = .ending
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            self.model.lives -= 1
                            if self.model.lives == 0 {
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
                    if index < bombs.count {
                        bombs.remove(at: index)
                    }
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
                        self.resetGame()
                    }
                }
                if b.checkHit(pos: (i.frame)) {
                    model.gameState = .ending
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        //game over sunshine!
                        self.resetGame()
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
    
    @objc func refreshDisplay() {
        
        switch model.gameState {
        case .starting:
            break
        case .loading:
            break
        case .ending:
            checkBullets()
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
        guard model.bulletFired == false && model.gameState != .starting else {
            return
        }
        
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        
        if model.gameState == .loading {
            model.gameState = .starting
            startGame()
        } else {
            if let bsv = base?.spriteView {
                bullet = Bullet(pos: bsv.center, height: 24, width: 8)
                bullet?.position = bsv.center
                self.view.addSubview(bullet!.spriteView!)
                model.bulletFired = true
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

