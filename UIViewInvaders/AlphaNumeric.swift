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
        0,0,0,0,1,2,2,1,
        0,0,0,0,1,1,1,1],
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
     [1,1,0,0,0,1,1,1, //W
        2,1,1,1,1,1,2,1,
        2,2,1,2,1,2,2,1,
        2,2,1,2,1,2,2,1,
        2,2,1,2,1,2,2,1,
        2,2,2,2,2,2,2,1,
        1,1,2,1,2,1,1,1,
        0,1,1,1,1,1,1,0],
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

public struct AlphaNumericz {
    
    private let charDict: [Character:Int] = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"A":10,"B":11,"C":12,"D":13,"E":14,"F":15,"G":16,"H":17,"I":18,"J":19,"K":20,"L":21,"M":22,"N":23,"O":24,"P":25,"Q":26,"R":27,"S":28,"T":29,"U":30,"V":31,"W":32,"X":33,"Y":34,"Z":35," ":36,".":37]
    
    // return view containg character
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
  // return struct containing view and array of views 
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
    //Returns a UIView containing a string.
    
    func get(string:String,size:CGSize,fcol:UIColor,bcol:UIColor) -> UIView {
        var constraintsArray:[NSLayoutConstraint] = []
        var charViewArray:[UIView] = []
        let stringView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let charWidth:CGFloat = size.width / CGFloat(string.count)
        for (index, item) in string.uppercased().enumerated() {
            let v = getChar(char: item, size: CGSize(width: charWidth, height: size.height), position: CGPoint(x:CGFloat(index) * charWidth , y: 0),fcol: fcol, bcol: bcol)
            v.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                constraintsArray.append(leftConstraint(v,stringView))
            }
            else if index == string.count - 1
            {
                constraintsArray.append(rightConstraint(v,stringView))
                constraintsArray.append(leftPixelConstraint(v,charViewArray[index - 1]))
            } else {
                constraintsArray.append(leftPixelConstraint(v,charViewArray[index - 1]))
            }
            
            constraintsArray.append(topConstraint(v,stringView))
            constraintsArray.append(bottomConstraint(v,stringView))
            charViewArray.append(v)
            stringView.addSubview(v)

        }
        NSLayoutConstraint.activate(constraintsArray)
        return stringView
    }
    
    // get a single char from int poition
    
    func get(char:Int,size:CGSize,fcol:UIColor,bcol:UIColor) -> UIView {
        guard char >= 0 && char <= charDict.count else {
            return UIView()
        }
        let string:Character = charDict.filter{$1 == char}.map{$0.0}[0]
        var constraintsArray:[NSLayoutConstraint] = []
        var charViewArray:[UIView] = []
        let stringView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let charWidth:CGFloat = size.width
        let v = getChar(char: string, size: CGSize(width: charWidth, height: size.height), position: CGPoint(x: charWidth , y: 0),fcol: fcol, bcol: bcol)
        v.translatesAutoresizingMaskIntoConstraints = false
            constraintsArray.append(leftConstraint(v,stringView))
            constraintsArray.append(rightConstraint(v,stringView))
            constraintsArray.append(topConstraint(v,stringView))
            constraintsArray.append(bottomConstraint(v,stringView))
            charViewArray.append(v)
            stringView.addSubview(v)

        
        NSLayoutConstraint.activate(constraintsArray)
        return stringView
    }
    
    // Get a single character string from int pos
    func getCharacter(pos:Int) -> Character {
        guard pos >= 0 && pos <= charDict.count else {
            return Character("")
        }
        let string:Character = charDict.filter{$1 == pos}.map{$0.0}[0]
        print("Char is \(string)")
        return string
    }
    
    // Returns a uiview containing a string and an array of views that make up the string
    // We can use this array to change the values of the background colours to change the
    // text without having to recreate the whole thing from scratch.
    
    func getStringView(string:String,size:CGSize,fcol:UIColor,bcol:UIColor) -> StringViewArray {
        var tempView:[UIView]=[]
        var sv:StringView = StringView()
        var sva:StringViewArray = StringViewArray()
        var constraintsArray:[NSLayoutConstraint] = []
        sv.charView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let charWidth:CGFloat = size.width / CGFloat(string.count)
        sva.charViewArray.removeAll()
        for (index, item) in string.uppercased().enumerated() {
            let v = getCharAndArray(char: item, size: CGSize(width: charWidth, height: size.height), position: CGPoint(x:CGFloat(index) * charWidth , y: 0),fcol: fcol, bcol: bcol)
            v.charView?.translatesAutoresizingMaskIntoConstraints = false
            if index == 0 {
                constraintsArray.append(leftConstraint(v.charView!,sv.charView!))
            }
            else if index == string.count - 1
            {
                constraintsArray.append(rightConstraint(v.charView!,sv.charView!))
                constraintsArray.append(leftPixelConstraint(v.charView!,tempView[index - 1]))
            } else {
                constraintsArray.append(leftPixelConstraint(v.charView!,tempView[index - 1]))
            }
            constraintsArray.append(topConstraint(v.charView!,sv.charView!))
            constraintsArray.append(bottomConstraint(v.charView!,sv.charView!))
            sva.charViewArray.append(v.charViewArray)
            tempView.append(v.charView!)
            sv.charView?.addSubview(v.charView!)
        }
        NSLayoutConstraint.activate(constraintsArray)
        sva.charView = sv.charView
        return sva
    }
    
    // Returns a uiview containing a string and an array of views that make up the string
    // We can use this array to change the values of the background colours to change the
    // text without having to recreate the whole thing from scratch.
    
    func getCharView(char:Character,size:CGSize,fcol:UIColor,bcol:UIColor) -> StringView {
 //       var tempView:UIView = UIView()
        var sv:StringView = StringView()
        var constraintsArray:[NSLayoutConstraint] = []
        sv.charView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let charWidth:CGFloat = size.width
//        sva.charViewArray.removeAll()
        let v = getCharAndArray(char: char, size: CGSize(width: charWidth, height: size.height), position: CGPoint(x:charWidth , y: 0),fcol: fcol, bcol: bcol)
            v.charView?.translatesAutoresizingMaskIntoConstraints = false
            constraintsArray.append(leftConstraint(v.charView!,sv.charView!))
            constraintsArray.append(rightConstraint(v.charView!,sv.charView!))
           constraintsArray.append(topConstraint(v.charView!,sv.charView!))
            constraintsArray.append(bottomConstraint(v.charView!,sv.charView!))
            sv.charViewArray = v.charViewArray
//            tempView = v.charView!
            sv.charView?.addSubview(v.charView!)
        
        NSLayoutConstraint.activate(constraintsArray)
//        sva.charView = sv.charView
        return sv
    }
    
    // update an array of uiview to the new chracter
    
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
    
    func nextChar(pos:Int) -> Int {
        var pos = pos
//        guard pos < 0 && pos >= charDict.count else {
//            return 0
//        }
        pos += 1
        if (pos >= charDict.count) {
            return 0
        } else {
            return pos
        }
    }
    
    func prevChar(pos:Int) -> Int {
        var pos = pos
//        guard pos >= 0 && pos <= charDict.count else {
//            return 0
//        }
        pos -= 1
        if (pos < 0) {
            return charDict.count - 1
        } else {
            return pos
        }
    }
    
}

public struct zStringView {
    var charViewArray:[UIView] = []
    var charView:UIView?
}

public struct zStringViewArray {
    var charViewArray:[[UIView]] = [[]]
    var charView:UIView?
}

