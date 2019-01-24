//
//  Characters.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//
import Foundation

class Character {
    // default values
    var nameCharacter: String
    var defensePoints: Int
    var attackPoints: Int
    var weapon: Weapon
    let type: String
    var fullLifeBar: Int
    
    // init values
    init(nameCharacter: String,defensePoints: Int,attackPoints: Int,weapon: Weapon, type: String, fullLifeBar: Int) {
       self.nameCharacter = nameCharacter
       self.defensePoints = defensePoints
       self.attackPoints = attackPoints
       self.weapon = weapon
       self.type = type
       self.fullLifeBar = fullLifeBar
    }
    
    // If the current caracter is not a Magus, the current caracter will fight with the targetCharacter and each chracter will take defense points to each others.
    func fight(targetCharacter: Character) {
        if defensePoints > 0 {
            if targetCharacter.defensePoints <= 0 {
                print("This guy is already over!") // just in case of error system
            } else {
                targetCharacter.defensePoints -= weapon.injuries  // to take the defense points of the character enemy
                 print(" Your \(type) \(nameCharacter) just hit the \(targetCharacter.type) \(targetCharacter.nameCharacter) with his \(weapon.nameWeapon) taking \(weapon.injuries) defense points to him.")
                if targetCharacter.defensePoints <= 0 {
                    targetCharacter.defensePoints = 0
                    print ("\(targetCharacter.type) \(targetCharacter.nameCharacter) just died")
                }
            }
        } else {
            print("Sorry, you need to be revived! ") // just in case of error system
        }  // fighting in return if the opponent character is still alive
        
        if targetCharacter.defensePoints > 0 {
            if defensePoints <= 0 {
                print("This guy is already over!") // just in case of error system
            } else {
                defensePoints -= targetCharacter.weapon.injuries  // to take the defense points of the character enemy
                print(" The \(targetCharacter.type) \(targetCharacter.nameCharacter) hit the \(type) \(nameCharacter) with his \(targetCharacter.weapon.nameWeapon) taking \(targetCharacter.weapon.injuries) defense points to him.")
                if defensePoints <= 0 {
                    defensePoints = 0
                    print ("\(type) \(nameCharacter) just died")
                }
            }
        }
    }
    
    
  
} // End of class character







    
  
    
    
    
    
    
    


  
    
   
    
    
    
    
    



