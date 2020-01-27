//
//  Sprite.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 18/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

//import UIKit
//import UISprites
//
////let colors:[UIColor] = [.clear,.white,.red,.blue,.green,.yellow,.magenta,.cyan,.orange,.brown,.lightGray]
////let deadColors:[UIColor] = [.red,.orange,.yellow]
//
//class Invader: UISprite, Animates {
//    let invaderAnimatons =
//        [[0,0,0,0,0,0,0,0,0,0,
//          0,0,0,2,2,2,2,0,0,0,
//          0,0,1,1,1,1,1,1,0,0,
//          0,1,1,3,1,1,3,1,1,0,
//          0,1,3,1,1,1,1,3,1,0,
//          0,1,1,1,1,1,1,1,1,0,
//          0,0,1,1,1,1,1,1,0,0,
//          0,0,1,1,0,0,1,1,0,0,
//          0,4,4,0,0,0,0,4,4,0,
//          1,1,0,0,0,0,0,0,1,1],
//         [0,0,0,0,0,0,0,0,0,0,
//          0,0,0,3,3,3,3,0,0,0,
//          0,0,1,1,1,1,1,1,0,0,
//          0,1,1,3,1,1,3,1,1,0,
//          0,1,3,1,1,1,1,3,1,0,
//          1,1,1,1,1,1,1,1,1,1,
//          0,1,1,1,1,1,1,1,1,0,
//          0,4,4,1,0,0,1,4,4,0,
//          0,0,0,0,0,0,0,0,0,0,
//          0,0,0,0,0,0,0,0,0,0],
//         [0,0,0,0,0,0,0,0,0,0,
//          0,0,0,2,2,2,2,0,0,0,
//          0,0,1,1,1,1,1,1,0,0,
//          0,1,1,3,1,1,3,1,1,0,
//          0,1,3,1,1,1,1,3,1,0,
//          0,1,1,1,1,1,1,1,1,0,
//          0,0,1,1,1,1,1,1,0,0,
//          0,0,1,1,0,0,1,1,0,0,
//          0,4,4,0,0,0,0,4,4,0,
//          1,1,0,0,0,0,0,0,1,1]]
//
//    init(pos:CGPoint,height:Int,width:Int) {
//        super.init(pos: pos, height: height, width: width, animateArray: invaderAnimatons,frameWith:10,frameHeight:10,frames:3)
//    }
//}
//
//class Base: UISprite, Animates {
//
//    let baseAnimations =
//        [[0,0,0,0,0,1,1,0,0,0,0,0,
//          0,0,0,2,2,2,2,2,2,0,0,0,
//          0,0,1,1,1,1,1,1,1,1,0,0,
//          0,1,1,3,1,1,3,1,1,3,1,0,
//          0,1,1,1,1,1,1,1,1,1,1,0,
//          1,1,1,1,1,1,1,1,1,1,1,1],
//         [0,0,0,0,0,4,4,0,0,0,0,0,
//          0,0,0,0,2,2,2,2,0,0,0,0,
//          0,0,1,1,1,1,1,1,1,1,0,0,
//          0,3,1,1,3,1,1,3,1,1,0,0,
//          0,0,1,1,1,1,1,1,1,1,0,0,
//          0,1,1,1,1,1,1,1,1,1,1,0],
//         [0,0,0,0,0,1,1,0,0,0,0,0,
//          0,0,0,2,2,2,2,2,2,0,0,0,
//          0,0,1,1,1,1,1,1,1,1,0,0,
//          0,0,1,3,1,1,3,1,1,3,0,0,
//          0,0,1,1,1,1,1,1,1,1,0,0,
//          0,0,1,1,1,1,1,1,1,1,0,0]]
//
//    init(pos:CGPoint,height:Int,width:Int) {
//        super.init(pos: pos, height: height, width: width, animateArray: baseAnimations,frameWith:12,frameHeight:6,frames:3)
//    }
//}
//
//class Bullet: UISprite {
//
//    let bulletAnimations =
//        [[2,2,
//          2,2,
//          1,1,
//          1,1,
//          2,2,
//          2,2],
//         [1,1,1,1,1,1,1,1,1,1,1,1],
//         [1,1,1,1,1,1,1,1,1,1,1,1]]
//
//    init(pos:CGPoint,height:Int,width:Int) {
//        super.init(pos: pos, height: height, width: width, animateArray: bulletAnimations,frameWith:4,frameHeight:3,frames:1)
//    }
//}
//
//class Bomb: UISprite {
//
//    let bombAnimations =
//        [[2,2,
//          2,2,
//          1,1,
//          1,1,
//          2,2,
//          2,2],
//         [1,1,1,1,1,1,1,1,1,1,1,1],
//         [1,1,1,1,1,1,1,1,1,1,1,1]]
//
//    init(pos:CGPoint,height:Int,width:Int) {
//        super.init(pos: pos, height: height, width: width, animateArray: bombAnimations,frameWith:4,frameHeight:3,frames:1)
//    }
//}
//
//class Silo: UISprite {
//
//    let siloColours =
//        [0,0,0,0,5,5,5,5,5,5,5,5,5,5,5,5,0,0,0,0,
//         0,0,0,5,4,4,4,4,4,4,4,4,4,4,4,4,5,0,0,0,
//         0,0,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,0,0,
//         0,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,0,
//         5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
//         3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
//         3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]
//
//    init(pos:CGPoint,height:Int,width:Int) {
//        super.init(pos: pos, height: height, width: width, coloursArray: siloColours,frameWith:20,frameHeight:16,frames:1)
//    }
//
//    override func checkHit(pos:CGPoint) -> Bool {
//        if let spriteview = spriteView {
//            if spriteview.frame.contains(pos){
//                let sm = spriteview.superview?.convert(pos, to: spriteView)
//                for (index,v) in viewArray.enumerated() {
//                    if v.backgroundColor == .clear {
//                        continue
//                    }
//                    if v.frame.contains(sm!) {
//                        v.backgroundColor = .clear
//
//                        //make a bit more damage!
//                        if index > pixWidth {
//                            viewArray[index-pixWidth].backgroundColor = .clear
//                        }
//                        if index > 0  {
//                            viewArray[index-1].backgroundColor = .clear
//                        }
//                        if index < (pixWidth * pixHeight) {
//                            viewArray[index+1].backgroundColor = .clear
//                        }
//                        if index + pixWidth < (pixWidth * pixHeight) {
//                            viewArray[index+pixWidth].backgroundColor = .clear
//                            viewArray[index+pixWidth-1].backgroundColor = .clear
//                        }
//                        if index + (pixWidth * 2) < (pixWidth * pixHeight) {
//                            viewArray[index+(pixWidth*2)].backgroundColor = .clear
//                            viewArray[index-1 + (pixWidth*2)].backgroundColor = .clear
//                        }
//                        if index - (pixWidth * 2) > 1 {
//                            viewArray[index-(pixWidth*2)].backgroundColor = .clear
//                            viewArray[index-1 - (pixWidth*2)].backgroundColor = .clear
//                        }
//
//                        return true
//                    }
//                }
//                return false
//            }
//            return false
//        }
//        return false
//    }
//
//
//    override func checkHit(pos:CGRect) -> Bool {
//        if let spriteView = spriteView {
//        if spriteView.frame.intersects(pos){
//            let sm = spriteView.superview?.convert(pos, to: spriteView)
//            for v in viewArray {
//                if v.backgroundColor == .clear {
//                    continue
//                }
//                if sm!.contains(v.frame) {
//                    v.backgroundColor = .clear
//                }
//            }
//
//            return true
//        }
//        }
//        return false
//    }
//
//}
//
//
//class MotherShip: UISprite, Animates {
//
//    let motherAnimations =
//        [[0,0,0,0,0,1,1,0,0,0,0,0,
//          0,0,0,7,7,7,7,7,7,0,0,0,
//          0,4,4,4,4,4,4,4,4,4,4,0,
//          4,2,4,2,4,2,4,2,4,2,4,2,
//          0,4,4,4,4,4,4,4,4,4,4,0,
//          0,0,0,0,4,4,4,4,0,0,0,0],
//         [0,0,0,0,0,8,8,0,0,0,0,0,
//          0,0,0,7,7,7,7,7,7,0,0,0,
//          0,4,4,4,4,4,4,4,4,4,4,0,
//          2,4,2,4,2,4,2,4,2,4,2,4,
//          0,4,4,4,4,4,4,4,4,4,4,0,
//          0,0,0,0,4,4,4,4,0,0,0,0]]
//
//    init(pos:CGPoint,height:Int,width:Int) {
//        super.init(pos: pos, height: height, width: width, animateArray: motherAnimations,frameWith:12,frameHeight:6,frames:2)
//    }
//}

import UIKit
import UISprites

class Bomb: UISprite, Animates {    
    let bombAnimations =
    [[UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)], [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)]]
    
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: bombAnimations,frameWith:4,frameHeight:3,frames:2)
    }
}

class Base: UISprite, Animates {
    let baseAnimations =
    [[UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)], [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.2196078431372549, green: 0.7372549019607844, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.45098039215686275, blue: 0.6784313725490196, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 0.16862745098039217, blue: 0.16862745098039217, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)]]
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: baseAnimations,frameWith:12,frameHeight:6,frames:2)
    }
}

class MotherShip: UISprite, Animates {
    let morhershipAnimations =
    [[UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)], [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)]]
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: morhershipAnimations,frameWith:12,frameHeight:6,frames:2)
    }
}

class Silo: UISprite {
let siloAnimations =
[[UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0), UIColor(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0)]]
init(pos:CGPoint,height:Int,width:Int) {
    super.init(pos: pos, height: height, width: width, animateArray: siloAnimations,frameWith:20,frameHeight:16,frames:1)
}
    
    override func checkHit(pos:CGPoint) -> Bool {
        if let spriteview = spriteView {
            if spriteview.frame.contains(pos){
                let sm = spriteview.superview?.convert(pos, to: spriteView)
                for (index,v) in viewArray.enumerated() {
                    if v.backgroundColor?.cgColor.alpha == 0.0 {
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
                if v.backgroundColor?.cgColor.alpha == 0.0 {
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

class Bullet: UISprite, Animates {
    let bulletAnimations =
    [[UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)], [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)]]
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: bulletAnimations,frameWith:4,frameHeight:3,frames:2)
    }
}

class Invader: UISprite, Animates {
    let invaderAnimations =
    [[UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)], [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)], [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)]]
    init(pos:CGPoint,height:Int,width:Int) {
        super.init(pos: pos, height: height, width: width, animateArray: invaderAnimations,frameWith:10,frameHeight:10,frames:3)
    }
}



func animate(coloursArray:[[UIColor]],frame:Int,pixels:[UIView]) -> Void {
    let cols = coloursArray[frame]
    for (index, item) in cols.enumerated() {
        pixels[index].backgroundColor = item
    }
    
}

func animateDying(coloursArray:[[UIColor]],frame:Int,pixels:[UIView]) -> Void {
    let cols = coloursArray[frame]
    for (index, item) in cols.enumerated() {
        pixels[index].backgroundColor = item
    }
    for p in pixels {
        if p.backgroundColor != .clear {
            let i = Int.random(in: 0 ..< 3)
            p.backgroundColor = deadColors[i]
        }
    }
}

