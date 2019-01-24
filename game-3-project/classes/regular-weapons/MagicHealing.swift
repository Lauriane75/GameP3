//
//  MagicHealing.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// The Magus' weapon
class MagicHealing: Weapon {
    init() {
        super.init(nameWeapon: "MagicHealing", injuries: 0, healing: 20)
        // The magus can give defense point to characters of his own team + 100 defense points
    }
}
