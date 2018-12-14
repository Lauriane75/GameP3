//
//  game.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation

class Game {
    
    func input() -> Int {
        let strData = readLine();
        return Int(strData!)!
    }
    

// players1 or player2 ?
   

    
    var currentCharacter1 = Player1(CurrentCharacterChoice)
    var currentCharacter2 = Player2(CurrentCharacterChoice)
    
    
    func startFight(currentCharacter1 against : currentCharacter2) {
        Characters.hurt(injuries: self.weapon.injuries)
    }
    
    // conditions de jeu tant qu'il y a des points de défense
while currentCharacter1.defense > 0 && currentCharacter2.defense > 0 {
    currentCharacter1.startFight(against: currentCharacter2)
    
    
    if currentCharacter2.defense > 0 {
    currentCharacter2.startFight(against: currentCharacter1)
    }
}
    
var currentCharacter1.defense > 0 {

    if currentCharacter1.defense = currentCharacter1
        winner = currentCharacter1
    } else {
        winner = currentCharacter2
    
    }
    
    // the winner is printing
    print("winner")
    

    
        
    }
    
    
    
   /* var players = [Players]()
    var currentPlayer: Players?
    var opponent: Players?
    var ended: Bool {
        
        //        for player in players {
        //            if player.hasLost {
        //                return true
        //            }
        //        }
        
        return false
    
    func play(character: Characters) {
    }*/



