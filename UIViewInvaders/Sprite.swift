//
//  Sprite.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit

let colors:[UIColor] = [.clear,.white,.red,.blue,.green,.yellow,.magenta,.cyan,.orange,.brown]
let deadColors:[UIColor] = [.red,.orange,.yellow]

protocol Animates {
    var frames:Int {get set}
    var animateArray:[[Int]] {get set}
    mutating func animate()
}

class Sprite {
    
    var height:Int = 0
    var width:Int = 0
    var colour:UIColor = UIColor.clear
    var coloursArray:[Int] = []
    var animateArray:[[Int]] = [[]]
    var viewArray:[UIView] = []
    var spriteView:UIView?
    var pixWidth:Int = 0
    var pixHeight:Int = 0
    var frames: Int = 0
    var currentFrame = 0
    var isDead:Bool = false
    var isDying:Bool = false
    
    init(pos:CGPoint,height:Int,width:Int,animateArray:[[Int]],frameWith:Int,frameHeight:Int,frames:Int) {
        self.position = pos
        self.height = height
        self.width = width
        self.animateArray = animateArray
        self.frames = frames
        self.pixWidth = frameWith
        self.pixHeight = frameHeight
        
        spriteView = UIView(frame: CGRect(origin: self.position, size: CGSize(width: width, height: height)))
        spriteView?.backgroundColor = colour
        viewArray = layoutSprite(pixWidth,pixHeight,animateArray[0],spriteView!)
    }
    
    init(pos:CGPoint,height:Int,width:Int,coloursArray:[Int],frameWith:Int,frameHeight:Int,frames:Int) {
        self.position = pos
        self.height = height
        self.width = width
        self.coloursArray = coloursArray
        self.frames = frames
        self.pixWidth = frameWith
        self.pixHeight = frameHeight
        
        spriteView = UIView(frame: CGRect(origin: self.position, size: CGSize(width: width, height: height)))
        spriteView?.backgroundColor = colour
        viewArray = layoutSprite(pixWidth,pixHeight,coloursArray,spriteView!)
    }
    
    var position:CGPoint = CGPoint(x: 0, y: 0) {
        didSet{
            if let v = spriteView {
                v.center = position
            }
        }
    }
    
    func checkHit(pos:CGPoint) -> Bool {
        guard !isDead else {
            return false
        }
        if let spriteView = spriteView {
            if spriteView.frame.contains(pos){
                isDying = true
                if #available(iOS 10.0, *) {
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                    
                }
                return true
            }
        }
        return false
    }
    
    func checkHit(pos:CGRect) -> Bool {
        guard !isDead else {
            return false
        }
        if let spriteView = spriteView {
            if spriteView.frame.intersects(pos) {
                isDying = true
                if #available(iOS 10.0, *) {
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                }
                return true
            }
        }
        return false
    }
    
    func move(x:Int,y:Int) {
        var newPos = position
        newPos.x = newPos.x + CGFloat(x)
        newPos.y = newPos.y + CGFloat(y)
        position = newPos
    }
    
}

extension Sprite {
    func startAnimating(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.animate()
        }
    }
}

extension Sprite {
    func animate() {
        if isDying && !isDead {
            UIViewInvaders.animateDying(coloursArray: animateArray,frame: currentFrame,pixels: viewArray)
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [], animations: {
                self.isDead = true
                self.spriteView?.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
                self.spriteView?.alpha = 0
            }, completion: { (finished: Bool) in
                self.spriteView?.removeFromSuperview()
                self.isDying = false
            })
            startAnimating()
        } else if isDying {
            UIViewInvaders.animateDying(coloursArray: animateArray,frame: currentFrame,pixels: viewArray)
            currentFrame += 1
            if currentFrame == self.frames {
                currentFrame = 0
            }
            startAnimating()
        } else if !isDead && !isDying {
            
            UIViewInvaders.animate(coloursArray: animateArray,frame: currentFrame,pixels: viewArray)
            currentFrame += 1
            if currentFrame == self.frames {
                currentFrame = 0
            }
            startAnimating()
        }
    }
}


class Invader: Sprite, Animates {
    let invaderAnimatons =
        [[0,0,0,0,0,0,0,0,0,0,
          0,0,0,2,2,2,2,0,0,0,
          0,0,1,1,1,1,1,1,0,0,
          0,1,1,3,1,1,3,1,1,0,
          0,1,3,1,1,1,1,3,1,0,
          0,1,1,1,1,1,1,1,1,0,
          0,0,1,1,1,1,1,1,0,0,
          0,0,1,1,0,0,1,1,0,0,
          0,4,4,0,0,0,0,4,4,0,
          1,1,0,0,0,0,0,0,1,1],
         [0,0,0,0,0,0,0,0,0,0,
          0,0,0,3,3,3,3,0,0,0,
          0,0,1,1,1,1,1,1,0,0,
          0,1,1,3,1,1,3,1,1,0,
          0,1,3,1,1,1,1,3,1,0,
          1,1,1,1,1,1,1,1,1,1,
          0,1,1,1,1,1,1,1,1,0,
          0,4,4,1,0,0,1,4,4,0,
          0,0,0,0,0,0,0,0,0,0,
          0,0,0,0,0,0,0,0,0,0],
         [0,0,0,0,0,0,0,0,0,0,
          0,0,0,2,2,2,2,0,0,0,
          0,0,1,1,1,1,1,1,0,0,
          0,1,1,3,1,1,3,1,1,0,
          0,1,3,1,1,1,1,3,1,0,
          0,1,1,1,1,1,1,1,1,0,
          0,0,1,1,1,1,1,1,0,0,
          0,0,1,1,0,0,1,1,0,0,
          0,4,4,0,0,0,0,4,4,0,
          1,1,0,0,0,0,0,0,1,1]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: invaderAnimatons,frameWith:10,frameHeight:10,frames:3)
    }
}

class Base: Sprite, Animates {
    
    let baseAnimations =
        [[0,0,0,0,0,1,1,0,0,0,0,0,
          0,0,0,2,2,2,2,2,2,0,0,0,
          0,0,1,1,1,1,1,1,1,1,0,0,
          0,1,1,3,1,1,3,1,1,3,1,0,
          0,1,1,1,1,1,1,1,1,1,1,0,
          1,1,1,1,1,1,1,1,1,1,1,1],
         [0,0,0,0,0,4,4,0,0,0,0,0,
          0,0,0,0,2,2,2,2,0,0,0,0,
          0,0,1,1,1,1,1,1,1,1,0,0,
          0,3,1,1,3,1,1,3,1,1,0,0,
          0,0,1,1,1,1,1,1,1,1,0,0,
          0,1,1,1,1,1,1,1,1,1,1,0],
         [0,0,0,0,0,1,1,0,0,0,0,0,
          0,0,0,2,2,2,2,2,2,0,0,0,
          0,0,1,1,1,1,1,1,1,1,0,0,
          0,0,1,3,1,1,3,1,1,3,0,0,
          0,0,1,1,1,1,1,1,1,1,0,0,
          0,0,1,1,1,1,1,1,1,1,0,0]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: baseAnimations,frameWith:12,frameHeight:6,frames:3)
    }
}

class Bullet: Sprite {
    
    let bulletAnimations =
        [[2,2,
          2,2,
          1,1,
          1,1,
          2,2,
          2,2],
         [1,1,1,1,1,1,1,1,1,1,1,1],
         [1,1,1,1,1,1,1,1,1,1,1,1]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: bulletAnimations,frameWith:4,frameHeight:3,frames:1)
    }
}

class Bomb: Sprite {
    
    let bombAnimations =
        [[2,2,
          2,2,
          1,1,
          1,1,
          2,2,
          2,2],
         [1,1,1,1,1,1,1,1,1,1,1,1],
         [1,1,1,1,1,1,1,1,1,1,1,1]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: bombAnimations,frameWith:4,frameHeight:3,frames:1)
    }
}

class Silo: Sprite {
    
    let siloColours =
        [0,0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,
         0,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,
         0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,
         0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, coloursArray: siloColours,frameWith:20,frameHeight:16,frames:1)
    }
    
    override func checkHit(pos:CGPoint) -> Bool {
        if let spriteview = spriteView {
            if spriteview.frame.contains(pos){
                let sm = spriteview.superview?.convert(pos, to: spriteView)
                for (index,v) in viewArray.enumerated() {
                    if v.backgroundColor == .clear {
                        continue
                    }
                    if v.frame.contains(sm!) {
                        v.backgroundColor = .clear
                        
                        //make a bit more damage!
                        if index > pixWidth {
                            viewArray[index-pixWidth].backgroundColor = .clear
                        }
                        if index > 0  {
                            viewArray[index-1].backgroundColor = .clear
                        }
                        if index < (pixWidth * pixHeight) {
                            viewArray[index+1].backgroundColor = .clear
                        }
                        if index + pixWidth < (pixWidth * pixHeight) {
                            viewArray[index+pixWidth].backgroundColor = .clear
                            viewArray[index+pixWidth-1].backgroundColor = .clear
                        }
                        if index + (pixWidth * 2) < (pixWidth * pixHeight) {
                            viewArray[index+(pixWidth*2)].backgroundColor = .clear
                            viewArray[index-1 + (pixWidth*2)].backgroundColor = .clear
                        }
                        if index - (pixWidth * 2) > 1 {
                            viewArray[index-(pixWidth*2)].backgroundColor = .clear
                            viewArray[index-1 - (pixWidth*2)].backgroundColor = .clear
                        }
                        
                        return true
                    }
                }
                return false
            }
            return false
        }
        return false
    }
    
    
    override func checkHit(pos:CGRect) -> Bool {
        if let spriteView = spriteView {
        if spriteView.frame.intersects(pos){
            let sm = spriteView.superview?.convert(pos, to: spriteView)
            for v in viewArray {
                if v.backgroundColor == .clear {
                    continue
                }
                if sm!.contains(v.frame) {
                    v.backgroundColor = .clear
                }
            }
            
            return true
        }
        }
        return false
    }
    
}


class MotherShip: Sprite, Animates {
    
    let motherAnimations =
        [[0,0,0,0,0,1,1,0,0,0,0,0,
          0,0,0,7,7,7,7,7,7,0,0,0,
          0,1,1,1,1,1,1,1,1,1,1,0,
          1,5,1,5,1,1,5,1,1,5,1,1,
          0,1,1,1,1,1,1,1,1,1,1,0,
          0,0,0,0,0,1,1,0,0,0,0,0],
         [0,0,0,0,0,9,9,0,0,0,0,0,
          0,0,0,7,7,7,7,7,7,0,0,0,
          0,1,1,1,1,1,1,1,1,1,1,0,
          1,1,5,1,5,1,1,5,1,1,5,1,
          0,1,1,1,1,1,1,1,1,1,1,0,
          0,0,0,0,0,1,1,0,0,0,0,0],
         [0,0,0,0,0,1,1,0,0,0,0,0,
          0,0,0,7,7,7,7,7,7,0,0,0,
          0,1,1,1,1,1,1,1,1,1,1,0,
          1,5,1,5,1,1,5,1,1,5,1,1,
          0,1,1,1,1,1,1,1,1,1,1,0,
          0,0,0,0,0,1,1,0,0,0,0,0]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: motherAnimations,frameWith:12,frameHeight:6,frames:3)
    }
}


func animate(coloursArray:[[Int]],frame:Int,pixels:[UIView]) -> Void {
    let cols = coloursArray[frame]
    for (index, item) in cols.enumerated() {
        pixels[index].backgroundColor = colors[item]
    }
    
}

func animateDying(coloursArray:[[Int]],frame:Int,pixels:[UIView]) -> Void {
    let cols = coloursArray[frame]
    for (index, item) in cols.enumerated() {
        pixels[index].backgroundColor = colors[item]
    }
    for p in pixels {
        if p.backgroundColor != .clear {
            let i = Int.random(in: 0 ..< 3)
            p.backgroundColor = deadColors[i]
        }
    }
}

let layoutSprite = {(pixWidth:Int,pixHeight:Int,coloursArray:[Int],spriteView:UIView) -> [UIView] in
    var viewArray:[UIView] = []
    var constraintsArray:[NSLayoutConstraint] = []
    let wid = Int(spriteView.frame.width) / pixWidth
    let hig = Int(spriteView.frame.height) / pixHeight
    
    for w in 0...coloursArray.count-1 {
        let p = coloursArray[w]
        
        let v:UIView = UIView(frame: CGRect(x: (w % pixWidth) * hig , y: (w / pixHeight) * wid , width: wid, height: hig))
        
        v.translatesAutoresizingMaskIntoConstraints = false
        
        constraintsArray.append(heightConstraint(v,spriteView,pixHeight))
        constraintsArray.append(widthConstraint(v,spriteView,pixWidth))
        if w < pixWidth { //top row
            //print("Top row \(w)")
            constraintsArray.append(topConstraint(v,spriteView))
        }
        else if w >= pixHeight * (pixWidth - 1) { //bottom row
            //print("Bottom row \(w)")
            constraintsArray.append(bottomConstraint(v,spriteView))
        } else {
            constraintsArray.append(topPixelConstraint(v,viewArray[w-pixWidth]))
        }
        
        if w % pixWidth == 0 { //left pos
            //print("Left row \(w)")
            constraintsArray.append(leftConstraint(v,spriteView))
        } else if w % pixWidth == pixWidth - 1 { //right pos
            //print("Right row \(w)")
            constraintsArray.append(rightConstraint(v,spriteView))
            constraintsArray.append(leftPixelConstraint(v,viewArray[w-1]))
        } else {
            constraintsArray.append(leftPixelConstraint(v,viewArray[w-1]))
        }
        
        v.backgroundColor = colors[p]
        viewArray.append(v)
        spriteView.addSubview(v)
        
    }
    NSLayoutConstraint.activate(constraintsArray)
    spriteView.sizeToFit()
    return viewArray
}


let heightConstraint = {(me:UIView,toView:UIView,height:Int) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: toView.frame.height / CGFloat(height))
}

let widthConstraint = {(me:UIView,toView:UIView,width:Int) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: toView.frame.width / CGFloat(width))
}

let topConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
}

let topPixelConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
}

let leftConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
}

let leftPixelConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
}

let rightConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
}

let bottomPixelConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
}

let bottomConstraint = {(me:UIView, toView:UIView) -> NSLayoutConstraint in
    return NSLayoutConstraint(item: me, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: toView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
}


