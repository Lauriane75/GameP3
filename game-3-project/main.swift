//
//  main.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 14/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation

let game = Game()

while game.playerLost() == false {
    game.playGame()
}

print("End of Game !")


