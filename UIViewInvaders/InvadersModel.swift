//
//  InvadersModel.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 22/02/2019.
//  Copyright © 2019 Jaypeeff. All rights reserved.
//

import UIKit
import AVFoundation

enum GameState {
    case loading
    case starting
    case playing
    case nextLevel
    case ending
    case gameOver
    case hiScore
}

final class InvadersModel {
    weak var viewController:InvadersViewController?
    var layoutSet: Bool = false
    var bulletFired: Bool = false
    var gameState:GameState = .loading
    
    var lives:Int = 3 {
        didSet{
            viewController?.setLives()
        }
    }
    var level:Int = 1 {
        didSet{
            guard gameState != .loading else {
                return
            }
            viewController?.setLevel()
        }
    }
    var deadCount:Int = 0 {
        didSet{
            guard gameState != .loading else {
                return
            }
            if deadCount == numInvaders {
                nextLevel()
            }
        }
    }
    var score:Int = 0 {
        didSet{
            viewController?.updateScore()
        }
    }
    var baseSpeed: CGFloat = 2
    var leftMove: CGFloat = 0
    var rightMove: CGFloat = 0
    var invaderXSpeed:Int = 2
    var invaderYSpeed:Int = 0
    var bombSpeed:Int = 4
    var numInvaders:Int = 0
    
    func reset() {
        self.gameState = .loading
        self.invaderXSpeed = 2
        self.invaderYSpeed = 0
        self.bombSpeed = 4
        self.deadCount = 0
        self.lives = 3
        self.score = 0
        self.level = 1
        self.numInvaders = 0
    }
    
    func nextLevel() {
        self.gameState = .nextLevel
        self.invaderXSpeed = 2
        self.invaderYSpeed = 0
        self.bombSpeed = 4
        self.deadCount = 0
        self.lives += 1
        self.score += 1000
        self.level += 1
        self.numInvaders = 0
    }
    
    //Audio Stuff
    //Set up as much to start with and play sounds on a new thread
    //You'll probably want to turn the sound off after a bit.....
    
    var hitAudioPlayer: AVAudioPlayer?
    var shootAudioPlayer: AVAudioPlayer?
    var motherAudioPlayer: AVAudioPlayer?
    var baseAudioPlayer: AVAudioPlayer?
    var invaderAudioPlayer: AVAudioPlayer?
    
    lazy var shooturl = Bundle.main.url(forResource: "shoot", withExtension: "wav")
    lazy var killurl = Bundle.main.url(forResource: "invaderkilled", withExtension: "wav")
    lazy var explosionurl = Bundle.main.url(forResource: "explosion", withExtension: "wav")
    lazy var ufourl = Bundle.main.url(forResource: "ufo_highpitch", withExtension: "wav")
    lazy var invurl = Bundle.main.url(forResource: "fastinvader1", withExtension: "wav")
    
    func setSounds() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            shootAudioPlayer = try AVAudioPlayer(contentsOf: shooturl!, fileTypeHint: AVFileType.wav.rawValue)
            hitAudioPlayer = try AVAudioPlayer(contentsOf: killurl!, fileTypeHint: AVFileType.wav.rawValue)
            baseAudioPlayer = try AVAudioPlayer(contentsOf: explosionurl!, fileTypeHint: AVFileType.wav.rawValue)
            motherAudioPlayer = try AVAudioPlayer(contentsOf: ufourl!, fileTypeHint: AVFileType.wav.rawValue)
            invaderAudioPlayer = try AVAudioPlayer(contentsOf: invurl!, fileTypeHint: AVFileType.wav.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func shootSound(){
        Thread.detachNewThreadSelector(#selector(InvadersModel.playShootSound), toTarget: self, with: nil)
    }
    
    @objc func playShootSound(){
        guard let shootAudioPlayer = shootAudioPlayer else { return }
        shootAudioPlayer.play()
    }
    
    func hitSound() {
        Thread.detachNewThreadSelector(#selector(InvadersModel.playHitSound), toTarget: self, with: nil)
    }
    
    @objc func playHitSound(){
        guard let hitAudioPlayer = hitAudioPlayer else { return }
        hitAudioPlayer.play()
    }
    
    func baseHitSound() {
        Thread.detachNewThreadSelector(#selector(InvadersModel.playbaseHitSound), toTarget: self, with: nil)
    }
    
    @objc func playbaseHitSound(){
        guard let baseAudioPlayer = baseAudioPlayer else { return }
        baseAudioPlayer.play()
    }
    
    func motherSound()
    {
        Thread.detachNewThreadSelector(#selector(InvadersModel.playmotherSound), toTarget: self, with: nil)
    }
    
    @objc func playmotherSound(){
        guard let motherAudioPlayer = motherAudioPlayer else { return }
        motherAudioPlayer.play()
    }
    
    func invaderSound()
    {
        Thread.detachNewThreadSelector(#selector(InvadersModel.playinvaderSound), toTarget: self, with: nil)
    }
    
    @objc func playinvaderSound(){
        guard let invaderAudioPlayer = invaderAudioPlayer else { return }
        invaderAudioPlayer.play()
    }
}
