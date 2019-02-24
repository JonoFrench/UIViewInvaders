//
//  Numbers.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 21/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import Foundation
import UIKit

let pixelArray:[[Int]] =
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
        1,2,2,2,2,2,2,1,
        1,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //3
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,1,1,2,2,2,1,1,
        1,1,1,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //4
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,2,1,
        0,1,1,1,1,2,2,1,
        0,0,0,0,1,1,1,1,
        0,0,0,0,0,1,1,1],
     [1,1,1,1,1,1,1,0, //5
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,2,2,2,1,1,
        1,1,1,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        0,1,2,2,2,2,1,1,
        0,0,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //6
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,0,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //7
        1,2,2,2,2,2,2,1,
        1,1,1,1,1,2,2,0,
        0,1,1,1,2,2,1,1,
        0,0,1,2,2,1,1,1,
        0,0,1,2,2,1,1,1,
        0,0,1,2,2,1,1,0,
        0,0,1,1,1,1,1,0],
     [0,1,1,1,1,1,1,0, //8
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //9
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,2,1,
        0,1,1,1,1,2,2,1,
        0,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //A
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,0, //B
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        1,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //C
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,1,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,0],
     [1,1,1,1,1,1,1,0, //D
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //E
        1,2,2,2,2,2,2,1,
        1,2,2,1,1,1,1,1,
        1,2,2,2,2,2,1,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,2,2,2,2,1,
        1,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,1, //F
        1,2,2,2,2,2,2,1,
        1,2,2,1,1,1,1,1,
        1,2,2,2,2,2,1,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,1,1,1,1,1,
        1,1,1,1,1,0,0,0],
     [0,1,1,1,1,1,1,0, //G
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,1,1,1,
        1,2,2,1,2,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,1,2,1,
        0,1,1,1,1,1,1,0],
     [1,1,1,1,1,1,1,1, //H
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //I
        1,2,2,2,2,2,2,1,
        1,1,1,2,2,1,1,1,
        1,1,1,2,2,1,1,1,
        1,1,1,2,2,1,1,1,
        1,1,1,2,2,1,1,1,
        1,2,2,2,2,2,2,1,
        1,1,1,1,1,1,1,1],
     [0,0,1,1,1,1,1,0, //J
        0,0,1,2,2,2,2,1,
        0,0,1,1,1,2,2,1,
        1,1,1,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,0],
     [1,1,1,1,1,1,1,1, //K
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,0,0,0,0,0, //L
        1,2,2,1,0,0,0,0,
        1,2,2,1,0,0,0,0,
        1,2,2,1,0,0,0,0,
        1,2,2,1,1,1,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,2,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //M
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,2,1,
        1,2,1,2,2,1,2,1,
        1,2,1,1,1,1,2,1,
        1,2,1,1,1,1,2,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,1,0,1,1,1, //N
        1,2,2,1,1,1,2,1,
        1,2,2,2,1,1,2,1,
        1,2,2,2,2,1,2,1,
        1,2,1,2,2,2,2,1,
        1,2,1,1,2,2,2,1,
        1,2,1,1,1,2,2,1,
        1,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //O
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,0],
     [0,1,1,1,1,1,1,0, //P
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,1,1,1,0,0,
        1,1,1,1,1,0,0,0],
     [0,1,1,1,1,1,1,0, //Q
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,2,1,2,1,
        1,2,2,1,1,2,1,1,
        1,1,2,2,2,1,2,1,
        0,1,1,1,1,1,1,0],
     [0,1,1,1,1,1,1,0, //R
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,1,1,1,1,1,1],
     [0,1,1,1,1,1,1,0, //S
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,1,1,1,
        1,2,2,2,2,2,1,1,
        1,1,2,2,2,2,2,1,
        0,1,1,1,1,2,2,1,
        1,2,2,2,2,2,1,1,
        0,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //T
        1,2,2,2,2,2,2,1,
        1,1,1,2,2,1,1,1,
        0,1,1,2,2,1,1,1,
        0,0,1,2,2,1,1,0,
        0,0,1,2,2,1,1,0,
        0,0,1,2,2,1,1,0,
        0,0,1,1,1,1,1,0],
     [1,1,1,1,1,1,1,1, //U
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,1,1,1,1,0],
     [1,1,1,1,1,1,1,1, //V
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,2,2,1,1,1,
        0,0,0,1,1,1,1,0],
     [1,1,1,0,0,1,1,1, //W
        1,2,1,1,1,1,2,1,
        1,2,1,2,2,1,2,1,
        1,2,1,2,2,1,2,1,
        1,2,1,2,2,1,2,1,
        1,2,2,2,2,2,2,1,
        1,1,2,1,1,2,1,1,
        0,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //X
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //Y
        1,2,2,1,1,2,2,1,
        1,2,2,1,1,2,2,1,
        1,1,2,2,2,2,1,1,
        0,1,1,2,2,1,1,1,
        0,0,1,2,2,1,1,1,
        0,0,1,2,2,1,1,1,
        0,0,1,1,1,1,1,1],
     [1,1,1,1,1,1,1,1, //Z
        1,2,2,2,2,2,2,1,
        1,1,1,1,2,2,2,1,
        0,1,1,2,2,2,1,1,
        1,1,2,2,2,1,1,1,
        1,2,2,2,1,1,1,1,
        1,2,2,2,2,2,2,1,
        1,1,1,1,1,1,1,1],
     [0,0,0,0,0,0,0,0, //Space
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0,0, //.
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,
        0,0,1,1,1,0,0,0,
        0,0,1,2,1,0,0,0,
        0,0,1,1,1,0,0,0]
]

struct AlphaNumeric {
    
    private let charDict: [Character:Int] = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"A":10,"B":11,"C":12,"D":13,"E":14,"F":15,"G":16,"H":17,"I":18,"J":19,"K":20,"L":21,"M":22,"N":23,"O":24,"P":25,"Q":26,"R":27,"S":28,"T":29,"U":30,"V":31,"W":32,"X":33,"Y":34,"Z":35," ":36,".":37]
    
    private func getChar(char:Character,size:CGSize,position:CGPoint,fcol:UIColor,bcol:UIColor) -> UIView {
        let charPos = charDict[char]
        if let pos = charPos {
            let charView = UIView(frame: CGRect(origin: position, size: size))
            charView.backgroundColor = .clear
            let alphaArray = layoutSprite(8,8,pixelArray[pos],charView)
            for (index, item) in pixelArray[pos].enumerated() {
                if item == 1 {
                    alphaArray[index].backgroundColor = bcol
                } else if item == 2 {
                    alphaArray[index].backgroundColor = fcol
                } else {
                    alphaArray[index].backgroundColor = .clear
                }
            }
            return charView
        }
        return UIView()
    }
  
    private func getCharAndArray(char:Character,size:CGSize,position:CGPoint,fcol:UIColor,bcol:UIColor) -> StringView {
        var sv = StringView()
        let charPos = charDict[char]
        if let pos = charPos {
            let charView = UIView(frame: CGRect(origin: position, size: size))
            charView.backgroundColor = .clear
            let alphaArray = layoutSprite(8,8,pixelArray[pos],charView)
            for (index, item) in pixelArray[pos].enumerated() {
                if item == 1 {
                    alphaArray[index].backgroundColor = bcol
                } else if item == 2 {
                    alphaArray[index].backgroundColor = fcol
                } else {
                    alphaArray[index].backgroundColor = .clear
                }
            }
            sv.charView = charView
            sv.charViewArray = alphaArray
            return sv
        }
        return StringView()
    }
    
    func get(string:String,size:CGSize,fcol:UIColor,bcol:UIColor) -> UIView {
        var constraintsArray:[NSLayoutConstraint] = []
        var charViewArray:[UIView] = []
        let stringView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        //stringView.translatesAutoresizingMaskIntoConstraints = false
        let charWidth:CGFloat = size.width / CGFloat(string.count)
        print("getting string \(string) width \(size.width) charw \(charWidth)")
        for (index, item) in string.uppercased().enumerated() {
            let v = getChar(char: item, size: CGSize(width: charWidth, height: size.height), position: CGPoint(x:CGFloat(index) * charWidth , y: 0),fcol: fcol, bcol: bcol)
            //v.translatesAutoresizingMaskIntoConstraints = false
            charViewArray.append(v)
            stringView.addSubview(v)
            constraintsArray.append(heightConstraint(v,stringView,Int(size.height)))
            constraintsArray.append(widthConstraint(v,stringView,Int(charWidth)))
            if index == 0 {
                constraintsArray.append(leftConstraint(v,stringView))
            }
            else if index == string.count - 1
            {
                constraintsArray.append(rightConstraint(v,stringView))
                constraintsArray.append(leftConstraint(v,charViewArray[index - 1]))
            } else {
                constraintsArray.append(leftConstraint(v,charViewArray[index - 1]))
            }
            
            constraintsArray.append(topConstraint(v,stringView))
            constraintsArray.append(bottomConstraint(v,stringView))
            
        }
        //NSLayoutConstraint.activate(constraintsArray)
        stringView.sizeToFit()
        stringView.layoutIfNeeded()
        return stringView
    }
    
    func getStringView(string:String,size:CGSize,fcol:UIColor,bcol:UIColor) -> StringViewArray {
        var sv:StringView = StringView()
        var sva:StringViewArray = StringViewArray()
        var constraintsArray:[NSLayoutConstraint] = []
        sv.charView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        //stringView.translatesAutoresizingMaskIntoConstraints = false
        let charWidth:CGFloat = size.width / CGFloat(string.count)
        print("getting string view \(string) width \(size.width) charw \(charWidth)")
        sva.charViewArray.removeAll()
        for (index, item) in string.uppercased().enumerated() {
            let v = getCharAndArray(char: item, size: CGSize(width: charWidth, height: size.height), position: CGPoint(x:CGFloat(index) * charWidth , y: 0),fcol: fcol, bcol: bcol)
            //v.translatesAutoresizingMaskIntoConstraints = false
            sva.charViewArray.append(v.charViewArray)
            sv.charView?.addSubview(v.charView!)
            constraintsArray.append(heightConstraint(v.charView!,sv.charView!,Int(size.height)))
            constraintsArray.append(widthConstraint(v.charView!,sv.charView!,Int(charWidth)))
            if index == 0 {
                constraintsArray.append(leftConstraint(v.charView!,sv.charView!))
            }
            else if index == string.count - 1
            {
                constraintsArray.append(rightConstraint(v.charView!,sv.charView!))
               // constraintsArray.append(leftConstraint(v,sv.charViewArray[index - 1]))
            } else {
              //  constraintsArray.append(leftConstraint(v,sv.charViewArray[index - 1]))
            }
            
            constraintsArray.append(topConstraint(v.charView!,sv.charView!))
            constraintsArray.append(bottomConstraint(v.charView!,sv.charView!))
            
        }
        //NSLayoutConstraint.activate(constraintsArray)
        sv.charView!.sizeToFit()
        sv.charView!.layoutIfNeeded()
        sva.charView = sv.charView
        return sva
    }
    
    func updateChar(char:Character,viewArray:[UIView],fcol:UIColor,bcol:UIColor) {
        let charPos = charDict[char]
        if let pos = charPos {
            for (index, item) in pixelArray[pos].enumerated() {
                if item == 1 {
                    viewArray[index].backgroundColor = bcol
                } else if item == 2 {
                    viewArray[index].backgroundColor = fcol
                } else {
                    viewArray[index].backgroundColor = .clear
                }
            }
        }
    }
}

struct StringView {
    var charViewArray:[UIView] = []
    var charView:UIView?
}

struct StringViewArray {
    var charViewArray:[[UIView]] = [[]]
    var charView:UIView?
}

