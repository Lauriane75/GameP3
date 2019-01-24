//
//  Bite.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation
// From de Elixir => Walking dead's weapon on an opponent character
// The Elixir is a life potion which will transform the last dead character to a Walking Dead who can bite people.
class Bite:Weapon {
    init() {
        super.init(nameWeapon: "Bite", injuries: 70, healing: 0)
    }
}
