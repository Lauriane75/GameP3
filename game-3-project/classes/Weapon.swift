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
