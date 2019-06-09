//
//  Weapon.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation
// The general weapon class
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
