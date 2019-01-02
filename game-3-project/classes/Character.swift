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
    
    func fight(targetCharacter: Character) {
        if defensePoints > 0 {
            if targetCharacter.defensePoints <= 0 {
                print("This guy is already over!") // just in case of error system
            } else {
                targetCharacter.defensePoints -= weapon.injuries  // to take the defense points of the character enemy
                if targetCharacter.defensePoints <= 0 {
                    targetCharacter.defensePoints = 0
                    print ("\(targetCharacter.type) \(targetCharacter.nameCharacter) just died")
                }
                print(" Your \(type) \(nameCharacter) just hit the \(targetCharacter.type) \(targetCharacter.nameCharacter) with his \(weapon.nameWeapon) taking \(weapon.injuries) defense points to him.")
            }
        } else {
            print("Sorry, you need to be revived! ") // just in case of error system
        }  // fighting in return if the opponent character is still alive
        
        if targetCharacter.defensePoints > 0 {
            if defensePoints <= 0 {
                print("This guy is already over!") // just in case of error system
            } else {
                defensePoints -= targetCharacter.weapon.injuries  // to take the defense points of the character enemy
                if defensePoints <= 0 {
                    defensePoints = 0
                    print ("\(type) \(nameCharacter) just died")
                }
                print(" The \(targetCharacter.type) \(targetCharacter.nameCharacter) hit the \(type) \(nameCharacter) with his \(targetCharacter.weapon.nameWeapon) taking \(targetCharacter.weapon.injuries) defense points to him.")
                }
            }
        }
    
    
  
}
    

class Fighter: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 100,attackPoints: 10, weapon:Sword(), type: "Fighter", fullLifeBar: 100)
    }
}


class Magus: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 300,attackPoints: 0, weapon:MagicHealing(), type: "Magus", fullLifeBar: 300)
    }
    
    
    
    func cure(character: Character) {
        if defensePoints > 0 {
            if character.defensePoints <= 0 {
                print("I'm sorry this buddy just died")
            } else {
                character.defensePoints += weapon.healing  // give 50 life points to the character designated
                if character.defensePoints >= character.fullLifeBar { // to block the defense points at 100% for each character
                    character.defensePoints = character.fullLifeBar
                    print("Your \(character.type) \(character.nameCharacter) has all his life points.")
                }
                print("Your Magus just gave 50 defense points to your \(character.type) \(character.nameCharacter)")
                print("Name : \(character.type) \(character.nameCharacter)\nDefense points : \(character.defensePoints)\nAttack points : \(character.weapon.injuries)")
            }
        } else {
            print("Your Magus is dead... Try to find an Elixir potion to bring it back to life.")
        }
    }
    
}
    

    




class Colossus: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 400,attackPoints: 5, weapon:Hammer(), type: "Colossus", fullLifeBar: 400)
    }
}

class Dwarf: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 70,attackPoints: 50, weapon:Axe(), type: "Dwarf", fullLifeBar: 70)
    }
}

class GiantDwarf: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 150,attackPoints: 50, weapon:Axe(), type: "Giant Dwarf", fullLifeBar: 150)
    }
}

//let availableCharacterTypes: [Character.Type] = [Fighter.self, Magus.self, Colossus.self, Dwarf.self]







/*
 
 Bonus ouverture de la magic box avec les potions
 func usePotion() {
 self.potionType
 }
 
 */

    
  
    
    
    
    
    
    


  
    
   
    
    
    
    
    



