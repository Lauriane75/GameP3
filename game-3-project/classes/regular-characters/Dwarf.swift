//
//  Dwarf.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// the character Dwarf
class Dwarf: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 70, attackPoints: 50,
                   weapon: Axe(), type: "Dwarf", fullLifeBar: 70)
    }
}
