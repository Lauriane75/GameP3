//
//  game.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation


class Game {
    
     var arrayPlayer = [Player]() // Array of 2 players team1 & team2

    func startGame() {
     print("WELCOME TO THE MAGIC WORLD")
        
        for i in 1...2 { // ask about who is playing with a for i in loop
            print("")
            print ("Who is playing ?")
            print ("Player \(i+1)")
            print ("What's your name ?")
            let player = Player(namePlayer: <#String#>)
            let namePlayer = readLine()
            // ask for the player name
            print ("Name : \(String(describing: namePlayer))")
            arrayPlayer.append(player) // add the player in an array
        
        }
        
        // phase de combat
        //Fin du jeu
        // récompense gagnant
        
    }
    
  
    
    func battle() {
        print ("Let's start the game!")
        print ("Who wants to begin ?")
        // switch player in array to choose who will begin
        showThe2teams()
        print ("\(Player(namePlayer: <#String#>)) is playing") //-1 or +1
        // resume the 3 characters = call func()
        
        var currentCharacter:Character //question variable: type
        repeat {
            for i in 0..<arrayPlayer.count {
                let team = arrayPlayer[i]
                showThe2teams()
                print("===========================================")
                print("\(i+1), it's your turn : ")
                print("===========================================")
                print("\(i+1), please choose a character to start the battle")
                currentCharacter = arrayPlayer[i].arrayCharacter[characterChoice() - 1]
            }
        }
    }
    
        
        
    
    
    

    
    func characterChoice() -> Int {
        var currentCharacterChoice = 0
        repeat{
            currentCharacterChoice = input()
        } while currentCharacterChoice < 1 && currentCharacterChoice > 3
        return currentCharacterChoice
    }

    func showThe2teams() {
        for i in 0..<arrayPlayer.count {
            print("Who is going to win ? \(i+1)")
            _ = arrayPlayer[i]
            // call the func statsOfFights()
            
        }
        
    }
    
}
    


    
    

    

// players1 or player2 ?
/*repeat {
    for i in 0..<arrayPlayer.count {
        let team = arrayPlayer[i]
        print("===========================================")
        print("Player \(i+1), it's your turn : ")
        print("===========================================")
        // result
        print("Player \(i+1), choose a character from your team :")
        print ("Which character do you want to play with ?")
        print ("Choose between 1, 2 or 3")
        myFighter = arrayPlayer[i].character[characterChoice() - 1]
        // random magic box
        print("===========================================")
    }
}*/
   

