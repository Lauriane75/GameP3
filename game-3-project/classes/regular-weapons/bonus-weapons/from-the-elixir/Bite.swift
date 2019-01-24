//
//  Bite.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

// From de Elixir => Walking dead's weapon on an opponent character
// The Elixir is a magic potion which will transform one of the dead characters chose in the player own team to a walking dead character.
class Bite:Weapon {
    init() {
        super.init(nameWeapon: "Bite", injuries: 70, healing: 0)
    }
}
