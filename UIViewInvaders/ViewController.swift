//
//  ViewController.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leftButton: UIView?
    @IBOutlet weak var rightButton: UIView?
    @IBOutlet weak var fireButton: UIView?
    @IBOutlet weak var baseLine: UIView?
    @IBOutlet weak var coverView: UIView?
    var baseSpeed: CGFloat = 2
    var baseAnimationTimer: TimeInterval = TimeInterval()
    var leftMove: CGFloat = 0
    var rightMove: CGFloat = 0
    var base:Base?
    var motherShip:MotherShip?
    var baseLineY: CGFloat = 0
    var bulletFired: Bool = false
    var bullet:Bullet?
    var invaders:[Invader] = []
    var bombs:[Bomb] = []
    var silos:[Silo] = []
    var invaderXSpeed:Int = 2
    var invaderYSpeed:Int = 0
    var bombSpeed:Int = 4
    var deadCount:Int = 0
    var gameState:GameState = .loading
    var lives:Int = 3
    var score:Int = 0
    
    enum GameState {
        case loading
        case playing
        case ending
        //case gameOver
        //case hiScore
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fireButton?.layer.cornerRadius = (fireButton?.frame.height)! / 2
        leftButton?.roundCorners(corners:[.topLeft,.bottomLeft], radius: (leftButton?.frame.height)! / 2)
        rightButton?.roundCorners(corners:[.topRight,.bottomRight], radius: (rightButton?.frame.height)! / 2)
        coverView?.backgroundColor = .black
        coverView?.alpha = 0.75
        //let oo = Numbers(pos: CGPoint(x: 50, y: 50), height: 30, width: 30)
        //oo.spriteView!.alpha = 1.0
        //coverView?.addSubview(oo.spriteView!)
        setStars()
        setSilos()
        self.view.bringSubviewToFront(coverView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let displayLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(refreshDisplay))
        displayLink.add(to: .main, forMode:.common)
    }
    
    func resetGame() {
        coverView?.alpha = 0.75
        self.view.bringSubviewToFront(coverView!)
        gameState = .loading
        invaderXSpeed = 2
        invaderYSpeed = 0
        bombSpeed = 4
        deadCount = 0
        lives = 3
        for i in invaders {
            i.spriteView?.removeFromSuperview()
        }
        invaders.removeAll()
        
        for s in silos {
            s.spriteView?.removeFromSuperview()
        }
        silos.removeAll()
        setSilos()
        
        for b in bombs {
            b.spriteView?.removeFromSuperview()
        }
        bombs.removeAll()

        base?.spriteView?.removeFromSuperview()
        base = nil
        
        if motherShip != nil {
            motherShip?.spriteView?.removeFromSuperview()
            motherShip = nil
        }
    }
    
    func startGame() {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.coverView!.alpha = 0
        }, completion: { (finished: Bool) in
            self.setInvaders()
            self.setBase()
        })

    }
    
    func setStars() {
        let w = Int(self.view.frame.width)
        let h = Int((baseLine?.frame.maxY)!) 
        for _ in 1...500 {
            let x = Int.random(in: 0...w)
            let y = Int.random(in: 0...h)
            let star = UIView(frame: CGRect(x: x, y: y, width: 1, height: 1))
            star.backgroundColor = .white
            self.view.addSubview(star)
        }
    }
    
    func setSilos() {
        let sx = self.view.frame.width / 6
        for i in 1...3 {
            let s = Silo(pos: CGPoint(x: sx * CGFloat(i*2) - (sx), y: 600), height: 60, width: 80)
            self.view.addSubview((s.spriteView)!)
            silos.append(s)
        }
    }
    
    func setBase() {
        if base != nil {
            base?.spriteView?.removeFromSuperview()
        }
        
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
                base.position = CGPoint(x: self.view.frame.width / 2, y: self.baseLineY)
            })
        }
        
        
    }
    
    
    func setInvaders() {
        
        let viewWidth = self.view.frame.width
        let step = viewWidth / 6
        for i in stride(from: step, to: step * 6, by: step) {
            for z in stride(from: 100, to: 480, by: 60){
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
            self.gameState = .playing
            
        }
        
    }
    func checkMothership()
    {
        if motherShip == nil {
        
        if Int.random(in: 0...300) == 1 {
            motherShip = MotherShip(pos: CGPoint(x: self.view.frame.width + 10, y: 60), height: 30, width: 45)
            self.view.addSubview(motherShip!.spriteView!)
            motherShip?.animate()
            }
        } else {
            let x = (motherShip?.position.x)!
            if x < -20 {
                motherShip?.spriteView?.removeFromSuperview()
                motherShip = nil
            } else {
            motherShip?.position = CGPoint(x: x - 1, y: 60)
            }

        }
    }
    
    
    fileprivate func moveBase() {
        if base != nil {
            let x = (base?.position.x)!
            let y = (base?.position.y)!
            if leftMove > 0 && x > 0 {
                base?.position = CGPoint(x: x - baseSpeed, y: y)
            } else if rightMove > 0 && x < self.view.frame.width {
                base?.position = CGPoint(x: x + baseSpeed, y: y)
            }
        }
    }
    
    fileprivate func checkBullets() {
        if bulletFired {
            let pos = (bullet?.position)!
            if pos.y <= 0 {
                bulletFired = false
                bullet?.spriteView?.removeFromSuperview()
            } else {
                bullet?.position = CGPoint(x: pos.x, y: pos.y - 8)
                for inv in invaders {
                    if inv.checkHit(pos: (bullet?.spriteView?.center)!) == true {
                        bullet?.spriteView?.removeFromSuperview()
                        bulletFired = false
                        deadCount += 1
                    }
                }
            }
            for s in silos {
                if (s.checkHit(pos:(bullet?.position)!)) {
                    bullet?.spriteView?.removeFromSuperview()
                    bulletFired = false
                }
            }
            if motherShip != nil {
                if motherShip!.checkHit(pos: (bullet?.spriteView?.center)!) == true {
                    bullet?.spriteView?.removeFromSuperview()
                    bulletFired = false
                }
            }
        }
    }
    
    fileprivate func checkBombs() {
        for (index,bomb) in bombs.enumerated() {
            if bomb.position.y > baseLineY {
                //bomb.spriteView?.removeFromSuperview()
                bomb.isDying = true
                if index > bombs.count {
                    bombs.remove(at: index)
                }
                continue
            }
            bomb.move(x: 0, y: bombSpeed)
            if (base?.checkHit(pos:bomb.position))! {
                //bomb.spriteView?.removeFromSuperview()
                bomb.isDying = true
                if index > bombs.count {
                    bombs.remove(at: index)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.lives -= 1
                    if self.lives == 0 {
                        self.resetGame()
                    } else {
                        self.setBase()
                    }
                    
                }
                continue
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
            if Int.random(in: 0...1000) == 1 {
                dropBomb(pos: inv.position)
            }
            if invaderXSpeed > 0 {
                if inv.position.x > self.view.frame.width - 10 {
                    invaderXSpeed = -2 - (deadCount / 8)
                    invaderYSpeed = 5
                    break
                }
            } else {
                if inv.position.x < 10 {
                    invaderXSpeed = 2 + (deadCount / 8)
                    invaderYSpeed = 5
                    break
                }
            }
            if (base?.checkHit(pos: (inv.spriteView?.frame)!))! {
                gameState = .ending
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.resetGame()
                    
                }
               // print("base hit inv")
            }
            
            for s in silos {
            if (s.checkHit(pos: (inv.spriteView?.frame)!)) {

                //print("inv hit silo")
            }
            }
        }
    }
    
    @objc func refreshDisplay() {
        if gameState == .loading || gameState == .ending {return}
        
        moveBase()
        checkBullets()
        checkInvaders()
        moveInvaders()
        checkBombs()
        checkMothership()
    }
    
    func moveInvaders() {
        
        for inv in invaders {
            if inv.isDead {continue}
            inv.move(x: invaderXSpeed, y: invaderYSpeed)
        }
        if invaderYSpeed > 0 { invaderYSpeed = 0}
    }
    
    @objc func leftPressed(gesture:UILongPressGestureRecognizer) {
        guard gameState == .playing else {
            return
        }
        if gesture.state == .began {
            leftMove = baseSpeed
        } else if gesture.state == .ended {
            leftMove = 0
        }
        
    }
    
    @objc func rightPressed(gesture:UILongPressGestureRecognizer) {
        guard gameState == .playing else {
            return
        }
        if gesture.state == .began {
            rightMove = baseSpeed
        } else if gesture.state == .ended {
            rightMove = 0
        }
    }
    
    
    @objc func fire(gesture:UITapGestureRecognizer) {
        guard bulletFired == false else {
            return
        }
        
        
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        
        if gameState == .loading {
            startGame()
        } else {
            let basePos:CGPoint = (base?.spriteView?.center)!
            bullet = Bullet(pos: basePos, height: 24, width: 8)
            bullet?.position = basePos
            self.view.addSubview(bullet!.spriteView!)
            bulletFired = true
        }
    }
    
    func dropBomb(pos:CGPoint) {
        let bomb = Bomb(pos: pos, height: 24, width: 8)
        bomb.position = pos
        self.view.addSubview(bomb.spriteView!)
        bombs.append(bomb)
        bomb.startAnimating()
    }
    
}

