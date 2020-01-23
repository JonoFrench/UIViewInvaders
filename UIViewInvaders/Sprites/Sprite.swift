//
//  Sprite.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit
import UISprites

//let colors:[UIColor] = [.clear,.white,.red,.blue,.green,.yellow,.magenta,.cyan,.orange,.brown,.lightGray]
//let deadColors:[UIColor] = [.red,.orange,.yellow]

class Invader: UISprite, Animates {
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

class Base: UISprite, Animates {
    
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

class Bullet: UISprite {
    
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

class Bomb: UISprite {
    
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

class Silo: UISprite {
    
    let siloColours =
        [0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,0,
         0,0,0,5,4,4,4,4,4,4,4,4,4,4,4,4,5,0,0,0,
         0,0,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,0,0,
         0,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,0,
         5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
         3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
         3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]
    
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


class MotherShip: UISprite, Animates {
    
    let motherAnimations =
        [[0,0,0,0,0,1,1,0,0,0,0,0,
          0,0,0,7,7,7,7,7,7,0,0,0,
          0,4,4,4,4,4,4,4,4,4,4,0,
          4,2,4,2,4,2,4,2,4,2,4,2,
          0,4,4,4,4,4,4,4,4,4,4,0,
          0,0,0,0,4,4,4,4,0,0,0,0],
         [0,0,0,0,0,8,8,0,0,0,0,0,
          0,0,0,7,7,7,7,7,7,0,0,0,
          0,4,4,4,4,4,4,4,4,4,4,0,
          2,4,2,4,2,4,2,4,2,4,2,4,
          0,4,4,4,4,4,4,4,4,4,4,0,
          0,0,0,0,4,4,4,4,0,0,0,0]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: motherAnimations,frameWith:12,frameHeight:6,frames:2)
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

