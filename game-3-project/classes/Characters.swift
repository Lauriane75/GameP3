//
//  Characters.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//



import Foundation

enum CharacterType {
    case Fighter, Magus, Colossus, Dwarf
}

class Characters {
    var type: CharacterType //the type of character is an enumeration
   // var name: String //name of character is a String
    var defense: Int //point of life
    var weapon: Weapons // refers to attack points -> injuries property
    
    
    init(name: String, type: CharacterType) {
      //  self.name = name
        self.type = type
        
        switch self.type {
        case .Fighter:
            self.weapon = Sword()
            self.defense = 100
        case .Magus:
            self.weapon = MagicHealing()
            self.defense = 300
        case .Colossus:
            self.weapon = Hammer()
            self.defense = 400
        case .Dwarf:
            self.weapon = Axe()
            self.defense = 50
        }
    }
    
    
    func hurt(injuries: Int) {
        if self.defense < 0 {
            self.defense = 0
        }
    }
    
    
    
    
    // character's data description
    
    func dataSheetFighter() -> Fighter {
        return "Type of the character: \(self.type)"
        return "Defense points: \(self.defense)"
        return "Attack points: \(self.weapon.injuries)"
    }
    
    func dataSheetMagus() -> Magus {
        return "Type of the character: \(self.type)"
        return "Defense points: \(self.defense)"
        return "Attack points: \(self.weapon.injuries)"
    }
    
    func dataSheetColossus() -> Colossus {
        return "Type of the character: \(self.type)"
        return "Defense points: \(self.defense)"
        return "Attack points: \(self.weapon.injuries)"
    }
    
    func dataSheetDwarf() -> Dwarf {
        return "Type of the character: \(self.type)"
        return "Defense points: \(self.defense)"
        return "Attack points: \(self.weapon.injuries)"
    }
    
    self.dataSheetFighter()
    self.dataSheetMagus()
    self.dataSheetColossus()
    self.dataSheetDwarf()
    
}


/*
 
 Bonus ouverture de la magic box avec les potions
 func usePotion() {
 self.potionType
 }
 
 */

    
  
    
    
    
    
    
    


  
    
   
    
    
    
    
    



