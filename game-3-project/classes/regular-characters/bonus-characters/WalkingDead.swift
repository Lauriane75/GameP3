//
//  WalkingDead.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// the character WalkingDead in Bonus from the Zombie Potion
class WalkingDead: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 300, attackPoints: 70,
                   weapon: Bite(), type: "Walking Dead", fullLifeBar: 300)
    }
}
