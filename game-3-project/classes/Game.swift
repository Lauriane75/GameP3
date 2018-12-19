//
//  game.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation


class Game {
    
     var tabPlayer = [Player]() // Array of 2 players team1 & team

    func startGame() {
        _ = createTeam
    }
    
    
    // compose a team
   func createTeam() -> Player {
    let teamName = ""
        repeat {
        } while teamName == ""
    let team = Player(namePlayer: teamName)
    team.createYourTeam()
        return team
    }
}
    
    

    

// players1 or player2 ?
   

