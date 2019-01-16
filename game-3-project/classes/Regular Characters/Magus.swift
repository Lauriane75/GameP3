//
//  Magus.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

class Magus: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 200,attackPoints: 0, weapon:MagicHealing(), type: "Magus", fullLifeBar: 200)
    }
    
    
    // the action of the magus to heal one of the caracter of his own team
    func cure(character: Character) {
        if defensePoints > 0 {
            if character.defensePoints <= 0 {
                print("I'm sorry this buddy just died")
            } else {
                character.defensePoints += weapon.healing  // give 50 life points to the character designated
                print("Your Magus just gave 50 defense points to your \(character.type) \(character.nameCharacter)")
                print("Name : \(character.type) \(character.nameCharacter)    Defense points : \(character.defensePoints)    Attack points : \(character.weapon.injuries)")
                if character.defensePoints >= character.fullLifeBar { // to block the defense points at 100% for each character
                    character.defensePoints = character.fullLifeBar
                    print("Your \(character.type) \(character.nameCharacter) has all his life points.")
                }
            }
        } else {
            print("Your Magus is dead... Try to find an Elixir potion to bring it back to life.")
        }
    }
    
} // End of Magus Class
