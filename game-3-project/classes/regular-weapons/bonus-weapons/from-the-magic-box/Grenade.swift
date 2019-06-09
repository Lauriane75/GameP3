//
//  Grenade.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// From the MagicBox => Can be use by a Fighter or a Colossus on an opponent character
class Grenade: Weapon {
    init() {
        super.init(nameWeapon: "Grenade", injuries: 80, healing: 0)
    }
}
