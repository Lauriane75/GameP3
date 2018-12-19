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

    
    // init values
    init(nameCharacter: String,defensePoints: Int,attackPoints: Int,weapon: Weapon, type: String) {
       self.nameCharacter = nameCharacter
       self.defensePoints = defensePoints
       self.attackPoints = attackPoints
       self.weapon = weapon
       self.type = type
    }
    
}
    

class Fighter: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 100,attackPoints: 10, weapon:Sword(), type: "Fighter")
    }
}


class Magus: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 300,attackPoints: 0, weapon:MagicHealing(), type: "Magus")
    }
}



class Colossus: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 400,attackPoints: 5, weapon:Hammer(), type: "Colossus")
    }
}

class Dwarf: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 50,attackPoints: 50, weapon:Axe(), type: "Dwarf")
    }
}

let availableCharacterTypes: [Character.Type] = [Fighter.self, Magus.self, Colossus.self, Dwarf.self]







/*
 
 Bonus ouverture de la magic box avec les potions
 func usePotion() {
 self.potionType
 }
 
 */

    
  
    
    
    
    
    
    


  
    
   
    
    
    
    
    


