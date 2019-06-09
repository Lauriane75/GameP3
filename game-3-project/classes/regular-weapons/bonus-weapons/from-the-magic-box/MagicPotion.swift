//
//  MagicPotion.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// From the MagicBox => Can be use by a Magus on a character of the same team
class MagicPotion: Weapon {
    init() {
        super.init(nameWeapon: "Magic Potion", injuries: 0, healing: 100)
        // That potion give 100 defense points to the character
    }
}
