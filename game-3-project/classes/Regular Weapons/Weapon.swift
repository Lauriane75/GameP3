//
//  Weapon.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation

class Weapon {
    let nameWeapon: String
    var injuries: Int
    var healing: Int
    
    
    init(nameWeapon: String, injuries: Int, healing: Int) {
        self.injuries = injuries
        self.nameWeapon = nameWeapon
        self.healing = healing
    }
}

class Sword: Weapon {
    init() {
        super.init(nameWeapon: "Sword", injuries: 10, healing: 0)
    }
}

class MagicHealing: Weapon {
    init() {
        super.init(nameWeapon: "MagicHealing", injuries: 0, healing: 50)
        // The magus can give defense point to characters of his own team + 100 defense points
    }
}

class Hammer: Weapon {
    init() {
        super.init(nameWeapon: "Hammer", injuries: 5, healing: 0)
    }
}

class Axe: Weapon {
    init() {
        super.init(nameWeapon: "Axe", injuries: 50, healing: 0)
    }
}

// new weapon in the magic box

// From the MagicBox => Can be use by a Magus on a character of the same team
class MagicPotion:Weapon {
    init(){
        super.init(nameWeapon: "Magic Potion", injuries: 0, healing: 400)
        // That weapon has to give full defense bar to each character
    } 
}
// From the MagicBox => Can be use by a Dwarf on an opponent character
class MagicMushroom:Weapon {
    init(){
        super.init(nameWeapon: "Magic Mushroom", injuries: 0, healing: 150)
    }
}

// From the MagicBox => Can be use by a Fighter or a Colossus on an opponent character
class Grenade:Weapon {
    init() {
        super.init(nameWeapon: "Grenade", injuries: 70, healing: 0)
    }
}

// From de Elixir => Walking dead's weapon on an opponent character
// The Elixir is a magic potion which will transform one of the dead characters chose in the player own team to a walking dead character.
class Bite:Weapon {
    init() {
        super.init(nameWeapon: "Bite", injuries: 50, healing: 0)
    }
}
