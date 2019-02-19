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
    
    var baseSpeed: CGFloat = 2
    var baseAnimationTimer: TimeInterval = TimeInterval()
    var leftMove: CGFloat = 0
    var rightMove: CGFloat = 0
    var base:Base?
    var baseLineY: CGFloat = 0
    var bulletFired: Bool = false
    var bullet:Bullet?
    var invaders:[Invader] = []
    
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
        let displayLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(refreshDisplay))
        displayLink.add(to: .main, forMode:.common)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fireButton?.layer.cornerRadius = (fireButton?.frame.height)! / 2
        leftButton?.roundCorners(corners:[.topLeft,.bottomLeft], radius: (leftButton?.frame.height)! / 2)
        rightButton?.roundCorners(corners:[.topRight,.bottomRight], radius: (rightButton?.frame.height)! / 2)
        baseLineY = (baseLine?.frame.origin.y)! - 60
        base = Base(pos: CGPoint(x: 150, y: baseLineY), height: 30, width: 45)
        self.view.addSubview((base?.spriteView)!)
        base?.animate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //var ship:Sprite = Sprite()
        //var invader:Invader = Invader(pos: CGPoint(x: 100, y: 100), height: 40, width: 40)
        //self.view.addSubview(invader.spriteView!)
        
        
        let w = self.view.frame.width
        let step = w / 6
        for i in stride(from: step, to: step * 6, by: step) {
            for z in stride(from: 100, to: 480, by: 80){
                var invader:Invader = Invader(pos: CGPoint(x: i, y: CGFloat(Float(z))), height: 40, width: 40)
            self.view.addSubview(invader.spriteView!)
            invaders.append(invader)
                invader.animate()
            }
        }
        
        
        //self.view.addSubview(ship.initWith(pos: CGPoint(x: 100, y: 100), height: 40, width: 40))
        
        //let sv:UIView = ship.initWith(pos: CGPoint(x: 100, y: 100), height: 89, width: 89)
        //self.view.addSubview(sv)
        //print("\(ship.spriteView!)")
        
        
//        UIView.animate(withDuration: 2.25, delay: 0.0, options: [], animations: {
//            invader.spriteView!.center = CGPoint(x: 200, y: 200)
//        }, completion: { (finished: Bool) in
//            invader.viewArray[16].backgroundColor = .yellow
//            //self.isOpen = true
//        })
        
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
    }
    
    @objc func refreshDisplay() {
        //self.setNeedsDisplay()
        if base != nil {
            let x = (base?.position.x)!
            if leftMove > 0 {
                base?.position = CGPoint(x: x - baseSpeed, y: baseLineY)
            } else if rightMove > 0 {
                base?.position = CGPoint(x: x + baseSpeed, y: baseLineY)
            }
        }
        if bulletFired {
            let pos = (bullet?.position)!
            if pos.y <= 0 {
                bulletFired = false
                bullet?.spriteView?.removeFromSuperview()
            } else {
            bullet?.position = CGPoint(x: pos.x, y: pos.y - 8)
            }
        }
        
    }
    
    @objc func leftPressed(gesture:UILongPressGestureRecognizer) {
        if gesture.state == .began {
            leftMove = baseSpeed
        } else if gesture.state == .ended {
            leftMove = 0
        }
        
    }
    
    @objc func rightPressed(gesture:UILongPressGestureRecognizer) {
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
        let basePos:CGPoint = CGPoint(x: (base?.position.x)! + CGFloat((base?.width)! / 2), y: (base?.position.y)! )
        //-  CGFloat(((base?.height)! / 2))
        bullet = Bullet(pos: basePos, height: 24, width: 8)
        self.view.addSubview(bullet!.spriteView!)
        bulletFired = true
    }
    
}

