//
//  Text.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/06/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

class Text {
    // introduction
    func welcome() {
        print("       *********************************")
        print("       *  WELCOME TO THE MAGIC WORLD ! * ")
        print("       *********************************")
        print("""
            Once upon a time there was a team of 3 friends who were looking
for a treasure that everyone was talking about, but no one had ever find it.\n
            This treasure was hiding in a magical and enchanted world.
After months and months of quest, they finally got to find the treasure, full of courage and exhausted.\n
            But that day, they were not the only ones.
Another mysterious team was already there to seize the treasure.\n
            Game Rules : In this game, you will create 2 teams of 3 characters
and start battles. Sometimes you will discover some surprises so pay attention.\n
            Now it's time to fight for the treasure\n Let's start the Game !\n
""")
    }
    
    func createTeamDescription() {
        print("Choose a character by typing a number between 1 et 4")
        print("*********************************************************************")
        print("1 = Fighter   - Defense: 100 - Attack: 10    - Magic Healing: 0")
        print("2 = Magus     - Defense: 300 - Attack: 0     - Magic Healing: +20")
        print("3 = Colossus  - Defense: 400 - Attack: 5     - Magic Healing: 0")
        print("4 = Dwarft    - Defense: 70  - Attack  : 50  - Magic Healing: 0")
        print("*********************************************************************\n")
    }

}
