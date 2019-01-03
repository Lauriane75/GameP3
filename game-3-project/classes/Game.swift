//
//  game.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation


class Game {
    
     var arrayPlayer = [Player]() // Array of 2 players player1 & player2

    
    

    
   
    
    
    
    func characterChoice() -> Int {
        var currentCharacterChoice = 0
        repeat{
            currentCharacterChoice = input()
        } while currentCharacterChoice < 1 && currentCharacterChoice > 3
        return currentCharacterChoice
    }
    
    
    
    func showThe2Teams() {
        for i in 0..<arrayPlayer.count {
            print("Who is going to win ? \(i+1)")
           let players = arrayPlayer[i]
           players.statsOfFights()
        }
    }
    
    
    
    
    
    
    // lauch the magic box randomly
    func magicBox(character: Character) {
        let random = arc4random_uniform(<#UInt32#>)
        if character.defensePoints >= 1 {
            if random <= 25 {
                if character is Magus {
                    print("Crazy! You've found a magic potion!")
                    print("Only a magus can give this potion to one of your buddy. It will give 100% of his defense points")
                    let newWeapon = MagicPotion()
                    character.weapon = newWeapon
                    if character is Dwarf {
                        print("You've find a magic mushroom")
                        print("Only Dwarfs like to eat it because it makes them much taller and bigger.")
                        print("If you eat it now you will transform to a giant dwarf and have a full 150 defense points")
                        let newWeapon = MagicMushroom()
                        let newCharacter = GiantDwarf(name:character.nameCharacter)

                        character.weapon = newWeapon
                        character.nameCharacter = newCharacter.nameCharacter
                        character.fullLifeBar = 150
                        
                        // the character becomes a GiantDwarf
                    } else { // If the character is a fighter or a Colossus he will find a grenade
                        print ("Wow! You've just dicovered a new weapon!")
                        print("You can use it during a battle on any character enemy. It will take  70 of his defense points.")
                        let newWeapon = Grenade()
                        character.weapon = newWeapon
                        
                   }
                }
            }
        }
        
       
        
    
        
   
        
    func battleDesignated(ind:Int,opponentPlayer:Player,character:Character) {
        opponentPlayer.statsOfFights() // show the opposite stats of fights of the player's characters
        print("\(ind+1), please choose someone of the opposit team to fight with.")
        let myTargetCharacter = opponentPlayer.arrayCharacter[characterChoice() - 1]
        character.fight(targetCharacter: myTargetCharacter)
        }
    
    
            
  
    
   func battle() {
        var currentCharacter:Character //question variable: type
        repeat {
            for i in 0..<arrayPlayer.count {
                _ = arrayPlayer[i]
                showThe2Teams() // this func is showing the 2 teams' stats of fights
                print("\n")
                print("\(i+1), it's your turn : ")
                print("\n")
                print("\(i+1), please choose a character to start the battle")
                arrayPlayer[i].statsOfFights()
                print("\(i+1), please choose a number between 1 and 3")
                currentCharacter = arrayPlayer[i].arrayCharacter[characterChoice() - 1]
                // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                magicBox(character: currentCharacter) // launch the magic box with 3 new weapons inside (depending on the type of character)
                if let magus = currentCharacter as? Magus{ // to verifie if the current character chose is a Magus or not
                arrayPlayer[i].statsOfFights() // show the stats of fights
                print("Choose someone of your team to cure him")
                magus.cure(character: arrayPlayer[i].arrayCharacter[characterChoice() - 1])
                    // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                } else {
                    let targetTeam = arrayPlayer[i+1]
                    battleDesignated( ind:i, opponentPlayer:targetTeam, character:currentCharacter)
                    }
                }
        } while true
    }
}
    
    
    func start() {
        print ("Let's start the game!")
        print ("Who wants to begin ?")
        
        // switch player in array to choose who will begin
        // showThe2Players() I have to create this func
        
        //let startBattle = battle()
    }
    
    func playGame() {
        print("WELCOME TO THE MAGIC WORLD")
        // setting up the game
        for i in 1...2 { // ask about who is playing with a for i in loop
            print ("Player \(i+1)")
           let namePlayer = nameYourPlayer()
            arrayPlayer.append(namePlayer) // add the player in an array
        }
        // Intro
        start()
        // fighting phase
        //battle()
        //End of game
        
        // winning reward
        
        
    }
    
    func nameYourPlayer() -> Player {
        print ("What's your name ?")
        var playerName = ""
        repeat {
            if let name = readLine() {
                playerName = name
            }
        } while playerName == ""
        let player = Player(namePlayer: playerName)
        player.createYourTeam()
        return player
        
        print ("Who's gonna play first ? Choose between 1 and 2")
        // Show the 2 players
        for i in 0..<arrayPlayer.count {
            print ("\(i+1) \(Player(namePlayer: playerName))")
        }
        choosePlayer()
        
    }
    
    
    func choosePlayer() {
        let playerChoice = input()
       
        switch playerChoice {
        case 1:
            _ = arrayPlayer.startIndex
        case 2:
            _ = arrayPlayer.endIndex
        default:
            return
        }
        
        
    }

    
    
   
    
   func winner() {
        for i in 0..<arrayPlayer.count {
            let player = arrayPlayer[i]
            if !player.theCharacterIsDead() {
                print("The winner is\(i+1)")
                // faire gagner une récompense pour pouvoir recommencer une partie
            }
        }
    }
    
    
    

}

    

    


