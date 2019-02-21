//
//  Numbers.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 21/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import Foundation
import UIKit

var alphanumerics:[UIView]?

class Numbers: Sprite {
    var position:CGPoint = CGPoint(x: 0, y: 0) {
        didSet{
            if let v = spriteView {
                v.center = position
            }
        }
    }
    var height:Int = 0
    var width:Int = 0
    var colour:UIColor = UIColor.clear
    var coloursArray:[Int] = []
    var viewArray:[UIView] = []
    var spriteView:UIView?
    var pixWidth:Int = 8
    var pixHeight:Int = 8
    var animateArray:[[Int]]
    var frames: Int = 1
    var currentFrame = 0
    var fColor:UIColor = .white
    var bColor:UIColor = .red

    init(pos:CGPoint,height:Int,width:Int) {
        self.position = pos
        self.height = height
        self.width = width
        self.frames = 1
        
        animateArray =
            [[0,1,1,1,1,1,1,0, //0
              1,1,2,2,2,2,1,1,
              1,2,2,1,1,2,2,1,
              1,2,2,1,1,2,2,1,
              1,2,2,1,1,2,2,1,
              1,2,2,1,1,2,2,1,
              1,1,2,2,2,2,1,1,
              0,1,1,1,1,1,1,0],
             [0,0,1,1,1,1,0,0, //1
              0,1,1,2,2,1,1,0,
              0,1,2,2,2,1,1,0,
              0,1,1,2,2,1,1,0,
              0,0,1,2,2,1,1,0,
              1,1,1,2,2,1,1,1,
              1,2,2,2,2,2,2,1,
              1,1,1,1,1,1,1,1],
             [0,1,1,1,1,1,1,0, //2
              1,1,2,2,2,2,1,1,
              1,2,2,1,1,2,2,1,
              1,1,1,1,1,2,2,1,
              0,1,1,2,2,2,1,1,
              1,1,2,2,1,1,1,1,
              1,1,2,2,1,1,1,1,
              1,1,1,1,1,1,1,1],
             [0,1,1,1,1,1,1,0, //3
              1,1,2,2,2,2,1,1,
              1,2,1,1,1,2,2,1,
              1,1,1,2,2,2,1,1,
              1,1,1,1,1,2,2,1,
              1,2,2,1,1,2,2,1,
              1,1,2,2,2,2,1,1,
              0,1,1,1,1,1,1,1],
             [1,1,1,1,1,1,1,1, //4
              1,2,2,1,1,2,2,1,
              1,2,2,1,1,2,2,1,
              1,2,2,1,1,2,2,1,
              0,1,2,2,2,2,2,1,
              0,0,1,1,1,2,2,1,
              0,0,0,0,1,1,1,1,
              0,0,0,0,0,1,1,1]
        ]
        
        spriteView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: height)))
//        spriteView?.center = self.position
//        spriteView?.backgroundColor = colour
        viewArray = layoutSprite(pixWidth,pixHeight,animateArray[0],spriteView!)

        for alpha in animateArray {
            let alphaView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 10, height:10)))
            let alphaArray = layoutSprite(pixWidth,pixHeight,alpha,alphaView)
            alphanumerics?.append(try! spriteView!.copyObject()! as! UIView)
        }
        
        
        for (index, item) in animateArray[0].enumerated() {
            if item == 1 {
                viewArray[index].backgroundColor = bColor
            } else if item == 2 {
                viewArray[index].backgroundColor = fColor
            } else {
                viewArray[index].backgroundColor = .clear
            }
        }
    }
//
//    func animate(coloursArray:[[Int]],frame:Int,pixels:[UIView]) -> Void {
//        let cols = coloursArray[frame]
//        for (index, item) in cols.enumerated() {
//            pixels[index].backgroundColor = colors[item]
//        }
//
//    }
//    [0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0,
//    0,0,0,0,0,0,0,0]
}
