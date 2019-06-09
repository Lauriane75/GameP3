//
//  Fighter.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// the character Fighter
class Fighter: Character {
    init(name: String) {
        super.init(nameCharacter: name, defensePoints: 100, attackPoints: 10,
                   weapon: Sword(), type: "Fighter", fullLifeBar: 100 )
    }
}
