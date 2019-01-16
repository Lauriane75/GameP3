//
//  Players.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation


class Player {
    
    var namePlayer: String
    //  var coinsForWinner = 10
    
    public var arrayCharacter = [Character]() // will create a team of 3 character by player only characters alive
    
    
    init(namePlayer: String) {
        self.namePlayer = namePlayer
    }
    
    public var arrayDeadCharacter : [Character] = [Character]()
    
    
    /*  public func arrayDeadCharacter() -> [Character] {
     let deadCharacters = arrayCharacter.filter { $0.defensePoints <= 0 }
     return deadCharacters
     }*/
    
    // To show the results of each character
    func statsOfFights() {
        for (i, item) in arrayCharacter.enumerated() {
            if item.defensePoints >= 1 {
                if item is Fighter || item is Colossus || item is Dwarf {
                    print("Name : \(i+1) \(item.type) \(item.nameCharacter)    Defense points : \(item.defensePoints)    Attack points : \(item.weapon.injuries)")
                } else if item is Magus {
                    print("Name : \(i+1) \(item.type) \(item.nameCharacter)    Defense points : \(item.defensePoints)    Healing points : \(item.weapon.healing)")
                }
            } else { // If the character is <= 0
                print("\(i+1) The \(item.type) \(item.nameCharacter), is dead, find something to bring it back to life.")
            }
        }
    }
    
    
    // To show dead characters of each player
    func showDeadCharacters() {
        print ("Here are all the dead characters")
        for (_, it) in arrayDeadCharacter.enumerated() {
            print ("Name: \(it.nameCharacter)\nType: \(it.type)\nDefense: \(it.defensePoints)\nAttack: \(it.attackPoints)")
        }
    }
    
    func zombiePotion(character: Character) {
        let random = arc4random_uniform(100)
        if character.defensePoints >= 1 {
            if random <= 40 {
                print ("You've just found a Zombie Potion!\nUse it to bring your last dead budy back to life and transform him in a walking dead")
                showDeadCharacters()
                var dead = lastDeadCharacter()
                if dead != nil {
                    dead = WalkingDead(name:lastDeadCharacter()?.nameCharacter ?? "Zombie")
                    print ("Great ! Your \(String(describing: lastDeadCharacter()?.type)) \(String(describing: lastDeadCharacter()?.nameCharacter)) got back to life and has transformed in zombie ")
                    _ = dead
                    print("Welcome to your new character \(String(describing: lastDeadCharacter()?.nameCharacter)) the walking dead")
                } else {
                    print ("Sorry you don't have any dead guy.")
                }
            }
        }
    }
    
    
    func magicElixir(ind:Int, player:Player,character:Character) {
        let random = arc4random_uniform(100)
        if character.defensePoints >= 1 {
            if random <= 25 {
                print ("You've just found an Elixir!\nUse it to bring your last dead budy back to life")
                showDeadCharacters()
                if lastDeadCharacter() != nil {
                    lastDeadCharacter()?.defensePoints = character.fullLifeBar
                    print ("Great ! Your \(String(describing: lastDeadCharacter()?.type)) \(String(describing: lastDeadCharacter()?.nameCharacter)) got back to life! ")
                } else {
                    print ("Sorry you don't have any dead guy.")
                }
            }
        }
    }
    
    func lastDeadCharacter() -> Character? {
        return arrayDeadCharacter.last
    }





} // End of Player class

    



    

        
   
    
    


