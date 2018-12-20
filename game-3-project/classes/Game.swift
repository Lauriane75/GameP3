//
//  game.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation


class Game {
    
     var tabPlayer = [Player]() // Array of 2 players team1 & team2

    func startGame() {
     print("WELCOME TO THE MAGIC WORLD")
        
        for i in 1...2 { // ask about who is playing with a for i in loop
            print("")
            print ("Who is playing ?")
            print ("Player \(i+1)")
            print ("What's your name ?")
            let player = Player(namePlayer: <#String#>)
            let namePlayer = readLine()  // ask for the player name
            print ("Name : \(String(describing: namePlayer))")
            tabPlayer.append(player) // add the player in an array
        
            _ = createTeam()
        }
        
        // phase de combat
        //Fin du jeu
        // récompense gagnant
        
    }
    // choisi un nom
    
  
    
    // compose a team
   func createTeam() -> Player {
    let teamName = ""
        repeat {
        } while teamName == ""
    let player = Player(namePlayer: teamName)
    player.createYourTeam()
        return player
    }
    
    
    
    
    func playerChoice() -> Int {
        var currentCharacterChoice = 0
        repeat{
            currentCharacterChoice = input()
        } while currentCharacterChoice < 1 && currentCharacterChoice > 3
        return currentCharacterChoice
    }
    
}
    
    

    

// players1 or player2 ?
/*repeat {
    for i in 0..<tabPlayer.count {
        let team = tabPlayer[i]
        print("===========================================")
        print("Player \(i+1), it's your turn : ")
        print("===========================================")
        // result
        print("Player \(i+1), choose a character from your team :")
        print ("Which character do you want to play with ?")
        print ("Choose between 1, 2 or 3")
        myFighter = tabPlayer[i].character[playerChoice() - 1]
        // random magic box
        print("===========================================")
    }
}*/
   

