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
    
    
    // To show the stats of fights of the 2 teams at the beginning of each battle
    func showThe2Teams() {
        print("Who is going to win ?")
        for (_, item) in arrayPlayer.enumerated() {
            print ("\(item.namePlayer)?")
            print ("or")
    
           item.statsOfFights()
        }
    }
    
    // lauch the magic box randomly
    // Magic Potion or Magic Mushroom or Grenade
    func magicBox(character: Character) {
        let random = arc4random_uniform(<#UInt32#>)
        if character.defensePoints >= 1 {
            if random <= 20 {
                if character is Magus {
                    print("Crazy! You've found a magic potion!")
                    print("Only a magus can give this potion to one of your buddy. It will give 100% of his defense points")
                    let newWeapon = MagicPotion()
                    character.weapon = newWeapon
                    if character is Dwarf {
                        print("You've found a magic mushroom")
                        print("Only Dwarfs like to eat it because it makes them much taller and bigger.")
                        print("If you eat it now you will transform to a giant dwarf and have a full 150 defense points")
                        let newWeapon = MagicMushroom()
                        let newCharacter = GiantDwarf(name:character.nameCharacter)

                        character.weapon = newWeapon
                        character.nameCharacter = newCharacter.nameCharacter
                        character.fullLifeBar = 150
                        
                        // question : comment on change le 150 en propriété de GiantDwarf
                        
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
        print("\(ind+1) Please choose someone of the opposit team to fight with.")
        let myTargetCharacter = opponentPlayer.arrayCharacter[characterChoice() - 1]
        character.fight(targetCharacter: myTargetCharacter)
        print ("Name : \(character.type) \(character.nameCharacter)   Defense points :\(character.defensePoints)\nName : \(myTargetCharacter.type)    Defense points: \(myTargetCharacter.nameCharacter)")
        }
        
        
        
     /*   func deadCharacterChoice() -> Int {
        var choseDeadCharacter = 0
        repeat{
            choseDeadCharacter = input()
        } while choseDeadCharacter < 1 && choseDeadCharacter > 3
        return choseDeadCharacter
    } */
        
        // To show dead characters of each player
        func showDeadCharacters() {
            print ("Here are all the dead characters")
            for (_, item) in arrayPlayer.enumerated() {
                for (_, it) in item.arrayDeadCharacter.enumerated() {
                    _ = item.arrayDeadCharacter
                    print ("Name: \(it.nameCharacter)\nType: \(it.type)\nDefense: \(it.defensePoints)\nAttack: \(it.attackPoints)")
            }
        }
    }
        
        func lastDeadCharacter() -> Character? {
            for (_, item) in arrayPlayer.enumerated() {
                for (_, _) in item.arrayDeadCharacter.enumerated() {
                    let deadCharacter = item.arrayCharacter.last
                    return deadCharacter
                }
            }
        }
    
    
      
     func magicElixir(character: Character) {
        let random = arc4random_uniform(<#UInt32#>)
        if character.defensePoints >= 1 {
            if random <= 25 {
                print ("You've just found an Elixir!\nUse it to bring your last dead budy back to life")
                showDeadCharacters()
                let lastDead = lastDeadCharacter()
                if lastDead != nil {
                    lastDeadCharacter()?.defensePoints = character.fullLifeBar
                    print ("Great ! Your \(String(describing: lastDeadCharacter()?.type)) \(String(describing: lastDeadCharacter()?.nameCharacter)) got back to life! ")
                    } else {
                    print ("Sorry you don't have any dead guy.")
                    }
                }
            }
        }
      
        
        func zombiePotion(character: Character) {
            let random = arc4random_uniform(<#UInt32#>)
            if character.defensePoints >= 1 {
                if random <= 40 {
                    print ("You've just found a Zombie Potion!\nUse it to bring your last dead budy back to life and transform him in a walking dead")
                    showDeadCharacters()
                    var dead = lastDeadCharacter()
                    dead = WalkingDead(name:lastDeadCharacter()?.nameCharacter ?? "Zombie")
                    print ("Great ! Your \(String(describing: lastDeadCharacter()?.type)) \(String(describing: lastDeadCharacter()?.nameCharacter)) got back to life and has transformed in zombie ")
                    _ = dead
                    print("Welcome to your new character \(String(describing: lastDeadCharacter()?.nameCharacter)) the walking dead")
                }
            }
        } // conditions si le tableau de deadCharacter est vide
    
        /* _ = deadCharacterChoice()
         for (ind, item) in arrayPlayer.enumerated() {
         var choseCharacter = arrayPlayer[ind]
         choseCharacter = arrayPlayer[ind].arrayDeadCharacter[deadCharacterChoice() - 1]
         }
         
         comment chosir le character à réanimer */
    
   
        func playerLost() -> Bool {
            var count = 0
            // To link the each arrayPlayer with each arrayCharacter
            for (_, item) in arrayPlayer.enumerated() {
                for (_, it) in item.arrayCharacter.enumerated() {
                    if it.defensePoints <= 0 {
                        print ("\(it.nameCharacter) just died")
                        let deadCharacter = it
                        count += 1
                        // To add each dead character to the arrayDeadCharacter
                        item.arrayDeadCharacter.append(deadCharacter)
                        // To filter each dead character from the arrayCharacter
                        _ = item.arrayCharacter.filter { $0.defensePoints <= 0 }
                        if count == 3 {
                            print ("\(item.namePlayer) lost.)")
                            print ("GAME OVER !")
                        }
                    }
                }
            }
            return true
        }
        
    
    // introduction
    func start() {
        print ("Let's start the game!")
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
        start()
        // Show the 2 players
        for i in 0..<arrayPlayer.count {
            print ("\(i+1) \(Player(namePlayer: playerName))")
        }
    }


    // to cure or to fight character vs character
    func battle() {
    var currentCharacter:Character // the current is a character type
        repeat {
            for (i, item) in arrayPlayer.enumerated() {
                _ = arrayPlayer[i]
                showThe2Teams() // this func is showing the 2 teams' stats of fights
                print("\n")
                print("\(i+1) \(item.namePlayer), it's your turn : ")
                print("\n")
                print("\(i+1) \(item.namePlayer) please choose a character to start the battle, typing a number between 1 and 3")
                arrayPlayer[i].statsOfFights()
                currentCharacter = arrayPlayer[i].arrayCharacter[characterChoice() - 1]
                // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                magicBox(character: currentCharacter) // launch the magic box with 3 new weapons inside (depending on the type of character)
                if let magus = currentCharacter as? Magus{ // to verifie if the current character chose is a Magus or not => It's an optional because maybe the player wouldn't choose a Magus to create his team
                arrayPlayer[i].statsOfFights() // show the stats of fights
                print("\(i+1) \(item.namePlayer), choose someone of your team to cure him")
                magus.cure(character: arrayPlayer[i].arrayCharacter[characterChoice() - 1])
                // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                    } else {
                    let targetTeam = arrayPlayer[i+1]
                    battleDesignated( ind:i, opponentPlayer:targetTeam, character:currentCharacter)
                  //  let loose = playerLost()
                }
            }
        } while true //loose = false
    }
    
    
    func playGame() {
    // Intro
    print("WELCOME TO THE MAGIC WORLD")
    // setting up the game
    for i in 1...2 {
    print ("Player \(i+1)")
    let namePlayer = nameYourPlayer() // name the 2 players
    arrayPlayer.append(namePlayer) // add the players in an array
        }
    // fighting phase
    battle()
    //End of game
    }
        
}

    
} // End of class Game



    

    


