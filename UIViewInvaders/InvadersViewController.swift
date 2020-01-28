//
//  ViewController.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit
import UIAlphaNumeric
import UISprites
import UIHighScores

class InvadersViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var leftButton: UIView?
    @IBOutlet weak var rightButton: UIView?
    @IBOutlet weak var fireButton: UIView?
    @IBOutlet weak var baseLine: UIView?
    @IBOutlet weak var coverView: UIView?
    @IBOutlet weak var scoreBox: UIView?
    @IBOutlet weak var levelBox: UIView?
    @IBOutlet weak var livesBox: UIView?
    
    @IBOutlet weak var leftBtnHeight: NSLayoutConstraint!
    @IBOutlet weak var leftBtnWidth: NSLayoutConstraint!
    @IBOutlet weak var rightBtnWidth: NSLayoutConstraint!
    @IBOutlet weak var rightBtnHeight: NSLayoutConstraint!
    @IBOutlet weak var fireBtnWidth: NSLayoutConstraint!
    @IBOutlet weak var fireBtnHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scoreHeight: NSLayoutConstraint!
    @IBOutlet weak var scoreWidth: NSLayoutConstraint!
    
    @IBOutlet weak var levelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var levelWidth: NSLayoutConstraint!
    @IBOutlet weak var livesHeight: NSLayoutConstraint!
    @IBOutlet weak var livesWidth: NSLayoutConstraint!
    
    @IBOutlet weak var baseLineBottom: NSLayoutConstraint!
    
    @IBOutlet weak var levelTop: NSLayoutConstraint!
    
    @IBOutlet weak var scoreTop: NSLayoutConstraint!
    
    @IBOutlet weak var livesTop: NSLayoutConstraint!
    var titleY = 20
    var titleHeight = 90
    var subTitleHeight = 60
    var startTextHeight:CGFloat = 30.0
    var startTextY:CGFloat = 50.0
    var highScoreYpos:CGFloat = 192
    var highScoreHeight:CGFloat = 300
    
    var siloBaseLine:CGFloat = 120
    
    var invaderPosY = 300
    var invaderFinishY = 600
    var invaderStride = 60
    var invaderSize = 40
    var introInvaders:CGFloat = 6
    var introView:UIView?
    var gameoverView:UIView?
    var levelView:UIView?
    var livesView:UIView?
    var siloWidth = 80
    var siloHeight = 60
    var invaderStartY = 100
    var invaderLevelIncrease = 20
    
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
    var highScore:UIHighScores?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the model
        model.viewController = self
        self.view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.bringSubviewToFront(coverView!)
        let displayLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(refreshDisplay))
        displayLink.add(to: .main, forMode:.common)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setConstraints()        
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        if !model.layoutSet { // only want to do this once.
            model.layoutSet = true
            baseLineY = ((baseLine?.center.y)!) - 15
            viewWidth = self.view.frame.width
            viewHeight = self.view.frame.height
            setScore()
            setLevel()
            setLives()
            setControls()
            //setStars()
            setIntro()
        }
    }
    
    func setConstraints() {
        if self.view.frame.height < 600 {
            leftBtnHeight.constant = 75
            leftBtnWidth.constant = 75
            rightBtnHeight.constant = 75
            rightBtnWidth.constant = 75
            fireBtnWidth.constant = 75
            fireBtnHeight.constant = 75
            
            scoreHeight.constant = 25
            livesHeight.constant = 25
            levelHeight.constant = 25
            
            scoreWidth.constant = 80
            livesWidth.constant = 80
            levelWidth.constant = 80
            
            baseLineBottom.constant = 80
            livesTop.constant = -10
            scoreTop.constant = -10
            levelTop.constant = -10
            
            titleY = 0
            titleHeight = 70
            subTitleHeight = 50
            startTextHeight = 25
            startTextY = 30
            
            highScoreYpos = 125
            highScoreHeight = 180
            
            invaderPosY = 220
            invaderFinishY = 420
            invaderStride = 50
            invaderSize = 35
            introInvaders = 5
            
            siloBaseLine = 90
            siloWidth = 70
            siloHeight = 50
            invaderStartY = 60
            invaderLevelIncrease = 15
            view.setNeedsLayout()
        }
    }
    
   
    fileprivate func setIntro(){
        introView = UIView(frame: CGRect(x: 0, y: 0, width: (coverView?.frame.width)!, height: (coverView?.frame.height)!))
        highScore = UIHighScores.init(xPos: 0, yPos: highScoreYpos, width: (introView?.frame.width)!, height: ((coverView?.frame.height)!) - (highScoreHeight))
        
        if let introView = introView, let coverView = coverView, let highScore = highScore {
            let w = coverView.frame.width
            let h = coverView.frame.height
            coverView.backgroundColor = UIColor.black.withAlphaComponent(0.10)
            coverView.addSubview(introView)
            introView.backgroundColor = .clear
            let alpha:UIAlphaNumeric = UIAlphaNumeric()
            
            let title = UIView(frame: CGRect(x: 0, y: titleY, width: Int(w), height: titleHeight))
            title.addSubview(alpha.get(string: "RETRO", size: (title.frame.size), fcol: .orange, bcol:.green ))
            title.backgroundColor = .clear
            introView.addSubview(title)
            
            let subTitle = UIView(frame: CGRect(x: 0, y: titleY + titleHeight + 5, width: Int(w), height: subTitleHeight))
            subTitle.addSubview(alpha.get(string: "INVADERS", size: (subTitle.frame.size), fcol: .green, bcol:.red ))
            subTitle.backgroundColor = .clear
            introView.addSubview(subTitle)
            
            let subTitle2 = UIView(frame: CGRect(x: 20, y: h - startTextY, width: w - 40, height: startTextHeight))
            subTitle2.addSubview(alpha.get(string: "TO PLAY", size: (subTitle2.frame.size), fcol: .red, bcol:.yellow ))
            subTitle2.backgroundColor = .clear
            introView.addSubview(subTitle2)
            
            let subTitle3 = UIView(frame: CGRect(x: 20, y: h - startTextY - startTextHeight - 5, width: w - 40, height: startTextHeight))
            subTitle3.addSubview(alpha.get(string: "PRESS FIRE", size: (subTitle3.frame.size), fcol: .red, bcol:.yellow ))
            subTitle3.backgroundColor = .clear
            introView.addSubview(subTitle3)
            introView.layoutIfNeeded()
            
            introView.addSubview(highScore.highScoreView)
            highScore.animateIn()
            let _ = highScore.xPositionsForSprites(spriteWidth: 60, offSet: 0, numberOfSprites: 3)
            let _ = highScore.xPositionsForSprites(spriteWidth: 60, offSet: 90, numberOfSprites: 3)
            let _ = highScore.xPositionsForSprites(spriteWidth: 60, offSet: 0, numberOfSprites: 4)
            let _ = highScore.xPositionsForSprites(spriteWidth: 30, offSet: 90, numberOfSprites: 4)
        }
        setIntroInvaders()
        self.view.bringSubviewToFront(coverView!)
    }
    
    fileprivate func setIntroInvaders() {
        var invaderType = 0
        let step = viewWidth / 6
        for i in stride(from: step, to: step * 6, by: step) {
            invaderType = 0
            for z in stride(from: invaderPosY, to: invaderFinishY, by: invaderStride){
                let invader:Invader = Invader(pos: CGPoint(x: viewWidth / 2, y: 20), height: invaderSize, width: invaderSize, invaderType:invaderType)
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
                invaderType += 1
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
        
        if let hiscore = highScore {
            hiscore.removeHighscore()
        }
    }
    
    fileprivate func removeWonInvaders(){
        for s in silos {
            s.isDying = true
            s.startAnimating()
        }
        
        let _ = invaders.filter{ !$0.isDead }.map{ invader in UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
            invader.spriteView?.transform = CGAffineTransform(scaleX: 3.1, y: 3.1)
            invader.spriteView?.alpha = 0
            invader.spriteView?.center = CGPoint(x: self.viewWidth / 2, y: self.viewHeight  )
        }, completion: { (finished: Bool) in
            invader.spriteView?.removeFromSuperview()
        })}
        
        model.gameState = .ending
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.model.gameState = .gameOver
            self.resetGame()
        }
    }
    
    fileprivate func setGameOverView(){
        for b in bombs {
            b.spriteView?.removeFromSuperview()
        }
        let alpha:UIAlphaNumeric = UIAlphaNumeric()
        gameoverView = UIView(frame: CGRect(x: 0, y: viewHeight / 2, width: (coverView?.frame.width)!, height: 40))
        if let gameoverView = gameoverView {
            let gov = UIView(frame: CGRect(x: 0, y: 0, width: gameoverView.frame.width, height: gameoverView.frame.height))
            gov.addSubview(alpha.get(string: "GAME OVER", size: (gov.frame.size), fcol: .red, bcol:.yellow ))
            gov.backgroundColor = .clear
            gameoverView.alpha = 0
            gameoverView.addSubview(gov)
            gameoverView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: CGFloat.pi)
            self.view.addSubview(gameoverView)
            UIView.animate(withDuration: 0.5, delay: 0.25, options: [], animations: {
                gameoverView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0).rotated(by: 0)
                gameoverView.alpha = 1
            }, completion: { (finished: Bool) in
                UIView.animate(withDuration: 0.5, delay: 3.0, options: [], animations: {
                    gameoverView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: CGFloat.pi)
                    gameoverView.alpha = 0
                }, completion: { (finished: Bool) in
                    if (self.highScore?.isNewHiScore(score: self.model.score))! {
                        self.introView = UIView(frame: CGRect(x: 0, y: 0, width: (self.coverView?.frame.width)!, height: (self.coverView?.frame.height)!))
                        self.introView?.alpha = 0
                        self.model.gameState = .hiScore
                        self.highScore?.showNewHiScore(frame: CGRect(x: 0, y: 100, width: (self.coverView?.frame.width)!, height: 480))
                        self.introView?.addSubview((self.highScore?.newHighScoreView!)!)
                        self.coverView?.alpha = 1
                        self.coverView?.addSubview(self.introView!)
                        self.introView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: CGFloat.pi)
                        UIView.animate(withDuration: 0.5, delay: 0.25, options: [], animations: {
                            self.introView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0).rotated(by: 0)
                            self.introView?.alpha = 1
                        }, completion: { (finished: Bool) in
                            
                        })
                    } else {
                        
                        self.coverView?.alpha = 1
                        self.model.gameState = .starting
                        gameoverView.removeFromSuperview()
                        self.setIntro()
                    }
                })
            })
        }
    }
    
    // reset the UI
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
        
        if let bul = bullet?.spriteView {
            bul.removeFromSuperview()
        }
        model.bulletFired = false
        
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
            self.highScore?.highScoreView.alpha = 0
            self.coverView!.alpha = 0
        }, completion: { (finished: Bool) in
            self.introView?.removeFromSuperview()
            self.model.reset()
            self.setSilos()
            self.setInvaders()
            self.setBase()
        })
    }
        
    fileprivate func checkMothership()
    {
        let yPos = (scoreBox?.center.y)! + 50
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
                        model.gameState = .dieing
                        self.soundFX.baseHitSound()
                        self.model.lives -= 1
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            //self.model.lives -= 1
                            if self.model.lives == 0 {
                                self.model.gameState = .ending
                                self.removeWonInvaders()
                                
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
                inv.rotateMe()
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
                inv.rotateMe()
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
                    if i.frame.minY > baseLineY - 30 {
                        model.gameState = .ending
                        removeWonInvaders()
                        break
                    }
                    if b.checkHit(pos: (i.frame)) {
                        model.gameState = .ending
                        removeWonInvaders()
                        self.soundFX.baseHitSound()
                        break
                    }
                }
            }
            for s in silos {
                if let isv = inv.spriteView {
                    let _ = s.checkHit(pos: isv.frame)
                 }
            }
        }
    }
    
    func moveInvaders() {
        let _ = invaders.filter{ !$0.isDead }.map{ $0.move(x: model.invaderXSpeed, y: model.invaderYSpeed)}
        if model.invaderYSpeed > 0 { model.invaderYSpeed = 0}
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
    
    
    //Game loop
    // refreshDisplay is called from the runloop and should be called every screen refresh cycle
    
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
        case .dieing:
            checkBullets()
            checkBombs()
            checkInvaders()
            moveInvaders()
            checkMothership()
            break
        case .ending:
            checkBullets()
            checkBombs()
            checkInvaders()
            //moveInvaders()
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
            //highScore?.newHighScore(newScore: model.score)
            break
        case .hiScore:
            break
        }
    }
    
    //Controls
    
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
    
    @objc func leftTapped(gesture:UIGestureRecognizer) {
        guard model.gameState == .hiScore else {
            return
        }
        if let hiscore = highScore {
            hiscore.charDown()
        }
    }
    
    @objc func rightTapped(gesture:UIGestureRecognizer) {
        guard model.gameState == .hiScore else {
            return
        }
        if let hiscore = highScore {
            hiscore.charUp()
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
        if model.gameState == .hiScore {
            if let hiscore = highScore, let introView = introView {
                hiscore.alphaPos += 1
                if (hiscore.alphaPos == 3) {
                    hiscore.addScores(score: model.score)
                    
                    UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                        introView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1).rotated(by: CGFloat.pi)
                        introView.alpha = 0
                    }, completion: { (finished: Bool) in
                        
                        self.coverView?.alpha = 1
                        self.model.gameState = .starting
                        introView.removeFromSuperview()
                        self.setIntro()
                    })
                } else {
                    hiscore.hilightChar()
                    
                }
            }
        }
        else if model.gameState == .starting || model.gameState == .gameOver {
            model.gameState = .loading
            startGame()
        } else if model.gameState != .ending && model.gameState != .dieing {
            if let bsv = base?.spriteView {
                bullet = Bullet(pos: bsv.center, height: 24, width: 8)
                bullet?.position = bsv.center
                self.view.addSubview(bullet!.spriteView!)
                model.bulletFired = true
                soundFX.shootSound()
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    

    
}

