//
//  MagicMushroom.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

// From the MagicBox => Can be use by a Dwarf on an opponent character
class MagicMushroom:Weapon {
    init(){
        super.init(nameWeapon: "Magic Mushroom", injuries: 0, healing: 150)
    }
}
