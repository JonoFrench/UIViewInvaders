//
//  Sounds.swift
//  UIViewInvaders
//
//  Created by Jonathan French on 28/01/2020.
//  Copyright © 2020 Jaypeeff. All rights reserved.
//

import Foundation

extension InvadersViewController {
    
    //Sounds
    
    func motherSound(){
        self.soundFX.motherSound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if self.motherShip != nil {
                if !(self.motherShip?.isDead)! {
                    self.motherSound()
                }
            }
        }
    }

    func invaderSound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.soundFX.invaderSound()
            if self.model.gameState == .playing || self.model.gameState == .loading || self.model.gameState == .starting {
                self.invaderSound()
            }
        }
    }
    
}
