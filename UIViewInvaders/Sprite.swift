//
//  Sprite.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit

let colors:[UIColor] = [.clear,.white,.red,.blue,.green,.yellow,.magenta,.cyan,.orange]

protocol Sprite {
    var position:CGPoint {get set}
    var height:Int {get set}
    var width:Int {get set}
    var colour:UIColor {get set}
    //var coloursArray:[Int] {get set}
    var viewArray:[UIView] {get set}
    var spriteView:UIView? {get set}
    var pixWidth:Int {get set}
    var pixHeight:Int {get set}
}

protocol Animates {
    var frames:Int {get set}
    var animateArray:[[Int]] {get set}
    mutating func animate()
}


class Invader: Sprite, Animates {
    var position:CGPoint = CGPoint(x: 0, y: 0)
    var height:Int = 0
    var width:Int = 0
    var colour:UIColor = UIColor.clear
    var coloursArray:[Int] = []
    var animateArray:[[Int]]
    var viewArray:[UIView] = []
    var spriteView:UIView?
    var pixWidth:Int = 10
    var pixHeight:Int = 10
    var frames: Int = 3
    var currentFrame = 0
    
    init(pos:CGPoint,height:Int,width:Int) {
        self.position = pos
        self.height = height
        self.width = width
        self.frames = 3
        animateArray =
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
        
        spriteView = UIView(frame: CGRect(origin: self.position, size: CGSize(width: width, height: height)))
        spriteView?.backgroundColor = colour
        //pixWidth:Int,pixHeight:Int,coloursArray:[Int],spriteView:UIView
        viewArray = layoutSprite(pixWidth,pixHeight,animateArray[0],spriteView!)
    }
    func startAnimating(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.animate()
            
        }
    }
    
    func animate() {
        UIViewInvaders.animate(coloursArray: animateArray,frame: currentFrame,pixels: viewArray)
        currentFrame += 1
        if currentFrame == self.frames {
            currentFrame = 0
        }
        startAnimating()
    }
}


class Base: Sprite, Animates {
    var position:CGPoint = CGPoint(x: 0, y: 0) {
        didSet{
            if let v = spriteView {
                v.frame.origin = position
            }
        }
    }
    var height:Int = 0
    var width:Int = 0
    var colour:UIColor = UIColor.clear
    var coloursArray:[Int] = []
    var viewArray:[UIView] = []
    var spriteView:UIView?
    var pixWidth:Int = 12
    var pixHeight:Int = 6
    var animateArray:[[Int]]
    var frames: Int = 3
    var currentFrame = 0
    
    init(pos:CGPoint,height:Int,width:Int) {
        self.position = pos
        self.height = height
        self.width = width
        self.frames = 3
        //animateArray.reserveCapacity(3:144)
        
        animateArray =
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
        
        spriteView = UIView(frame: CGRect(origin: self.position, size: CGSize(width: width, height: height)))
        spriteView?.backgroundColor = colour
        //pixWidth:Int,pixHeight:Int,coloursArray:[Int],spriteView:UIView
        viewArray = layoutSprite(pixWidth,pixHeight,animateArray[0],spriteView!)
    }
    func startAnimating(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.animate()

        }
    }
    
    func animate() {
        UIViewInvaders.animate(coloursArray: animateArray,frame: currentFrame,pixels: viewArray)
        currentFrame += 1
        if currentFrame == self.frames {
            currentFrame = 0
        }
        startAnimating()
    }
    
}

class Bullet: Sprite {
    var position:CGPoint = CGPoint(x: 0, y: 0) {
        didSet{
            if let v = spriteView {
                v.frame.origin = position
            }
        }
    }
    var height:Int = 0
    var width:Int = 0
    var colour:UIColor = UIColor.clear
    var coloursArray:[Int] = []
    var viewArray:[UIView] = []
    var spriteView:UIView?
    var pixWidth:Int = 4
    var pixHeight:Int = 3
    var animateArray:[[Int]]
    var frames: Int = 3
    var currentFrame = 0
    
    init(pos:CGPoint,height:Int,width:Int) {
        self.position = pos
        self.height = height
        self.width = width
        self.frames = 3
        
        animateArray =
            [[2,2,
              2,2,
              1,1,
              1,1,
              2,2,
              2,2],
             [1,1,1,1,1,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1,1,1,1,1]]
        
        spriteView = UIView(frame: CGRect(origin: self.position, size: CGSize(width: width, height: height)))
        spriteView?.backgroundColor = colour
        //pixWidth:Int,pixHeight:Int,coloursArray:[Int],spriteView:UIView
        viewArray = layoutSprite(pixWidth,pixHeight,animateArray[0],spriteView!)
    }
//    func startAnimating(){
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            self.animate()
//
//        }
//    }
//
//    func animate() {
//        UIViewInvaders.animate(coloursArray: animateArray,frame: currentFrame,pixels: viewArray)
//        currentFrame += 1
//        if currentFrame == self.frames {
//            currentFrame = 0
//        }
//        startAnimating()
//    }
    
}


//struct aSprite {
//    var position:CGPoint = CGPoint(x: 0, y: 0)
//    var height:Int = 0
//    var width:Int = 0
//    var colour:UIColor = UIColor.clear
//    var coloursArray:[Int] = []
//    var viewArray:[UIView] = []
//    var spriteView:UIView?
//    var pixWidth:Int = 10
//    var pixHeight:Int = 10
//
//    mutating func initWith(pos:CGPoint,height:Int,width:Int) -> UIView {
//        self.position = pos
//        self.height = height
//        self.width = width
//        spriteView = UIView(frame: CGRect(origin: self.position, size: CGSize(width: width, height: height)))
//        spriteView?.backgroundColor = colour
//
////        coloursArray =
////            [1,1,0,0,
////             0,1,0,1,
////             0
////]
//
//        coloursArray =
//            [0,0,0,0,0,0,0,0,0,0,
//             0,0,0,2,2,2,2,0,0,0,
//             0,0,1,1,1,1,1,1,0,0,
//             0,1,1,3,1,1,3,1,1,0,
//             0,1,3,1,1,1,1,3,1,0,
//             0,1,1,1,1,1,1,1,1,0,
//             0,0,1,1,1,1,1,1,0,0,
//             0,0,1,1,0,0,1,1,0,0,
//             0,4,4,0,0,0,0,4,4,0,
//             1,1,0,0,0,0,0,0,1,1]
//
//        var constraintsArray:[NSLayoutConstraint] = []
//        let wid = width / pixWidth
//        let hig = height / pixHeight
//
//        for w in 0...coloursArray.count-1 {
//            let p = coloursArray[w]
//
//            let v:UIView = UIView(frame: CGRect(x: (w % pixWidth) * hig , y: (w / pixHeight) * wid , width: wid, height: hig))
//
//            v.translatesAutoresizingMaskIntoConstraints = false
//
//            constraintsArray.append(heightConstraint(v,spriteView!))
//            constraintsArray.append(widthConstraint(v,spriteView!))
//            if w < pixWidth { //top row
//                print("Top row \(w)")
//                constraintsArray.append(topConstraint(v,spriteView!))
//            }
//            else if w >= pixHeight * (pixWidth - 1) { //bottom row
//                print("Bottom row \(w)")
//                constraintsArray.append(bottomConstraint(v,spriteView!))
//            } else {
//                constraintsArray.append(topPixelConstraint(v,viewArray[w-pixWidth]))
//            }
//
//            if w % pixWidth == 0 { //left pos
//                print("Left row \(w)")
//                constraintsArray.append(leftConstraint(v,spriteView!))
//            } else if w % pixWidth == pixWidth - 1 { //right pos
//                print("Right row \(w)")
//                constraintsArray.append(rightConstraint(v,spriteView!))
//                constraintsArray.append(leftPixelConstraint(v,viewArray[w-1]))
//            } else {
//                constraintsArray.append(leftPixelConstraint(v,viewArray[w-1]))
//            }
//
//            v.backgroundColor = colors[p]
//            viewArray.append(v)
//            spriteView?.addSubview(v)
//
//        }
//        NSLayoutConstraint.activate(constraintsArray)
//        spriteView?.sizeToFit()
//        return spriteView!
//    }
//}

func animate(coloursArray:[[Int]],frame:Int,pixels:[UIView]) -> Void {
    let cols = coloursArray[frame]
    for (index, item) in cols.enumerated() {
        pixels[index].backgroundColor = colors[item]
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
            print("Top row \(w)")
            constraintsArray.append(topConstraint(v,spriteView))
        }
        else if w >= pixHeight * (pixWidth - 1) { //bottom row
            print("Bottom row \(w)")
            constraintsArray.append(bottomConstraint(v,spriteView))
        } else {
            constraintsArray.append(topPixelConstraint(v,viewArray[w-pixWidth]))
        }
        
        if w % pixWidth == 0 { //left pos
            print("Left row \(w)")
            constraintsArray.append(leftConstraint(v,spriteView))
        } else if w % pixWidth == pixWidth - 1 { //right pos
            print("Right row \(w)")
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
    

