//
//  GiantDwarf.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// the character GiantDwarf in Bonus from the Magic Box
class GiantDwarf: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 150,attackPoints: 50, weapon:Axe(), type: "Giant Dwarf", fullLifeBar: 150)
    }
}
