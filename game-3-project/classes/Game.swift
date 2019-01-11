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
            if let strData = readLine() {
                if let strData = Int(strData) {
                    currentCharacterChoice = strData
                }
            }
        } while currentCharacterChoice != 1 && currentCharacterChoice != 2 && currentCharacterChoice != 3
        return currentCharacterChoice
    }
    
    func createTeamDescription() {
        print("**********************************************************************")
        print("1 = Fighter   - Defense: 100 - Attack: 10    - Magic Healing: 0")
        print("2 = Magus     - Defense: 300 - Attack: 0     - Magic Healing: +50")
        print("3 = Colossus  - Defense: 400 - Attack: 5     - Magic Healing: 0")
        print("4 = Dwarft    - Defense: 70  - Attack  : 50  - Magic Healing: 0")
        print("**********************************************************************\n")
        print("Choose a character by typing a number between 1 and 4 ")
    }
    
    func createYourTeam() {
        print ("OK, let's create your team ! \n")
        for (_, item) in arrayPlayer.enumerated() {
            print ("\(item.namePlayer) please ? \n")
            for _ in 0..<3 { // ask 3 times for 3 characters in the team
                var characterChoice  = 0
                repeat {
                    createTeamDescription()   // call the function describing character's properties
                    if let strData = readLine() {
                        if let strData = Int(strData) {
                            characterChoice = strData
                        }
                    }
                } while characterChoice != 1 && characterChoice != 2 && characterChoice != 3 && characterChoice != 4
                let nameYourCharacter = UniqueName.single.uniqueCharacterNames()
                
                switch characterChoice {
                case 1:
                    print("Your Fighter is called \(nameYourCharacter)")
                    item.arrayCharacter.append(Fighter(name: nameYourCharacter))
                case 2:
                    print("Your Magus is called \(nameYourCharacter)")
                    item.arrayCharacter.append(Magus(name: nameYourCharacter))
                case 3:
                    print("Your Colossus is called \(nameYourCharacter)")
                    item.arrayCharacter.append(Colossus(name: nameYourCharacter))
                case 4:
                    print("Your Dwarf is called \(nameYourCharacter)")
                    item.arrayCharacter.append(Dwarf(name: nameYourCharacter))
                default:
                    return
                }
            }
            print("Perfect! You are fine. ")
        }
    }
   
        
        
        
        // To show the stats of fights of the 2 teams at the beginning of each battle
        func showThe2Teams() {
            print("Who is going to win ?")
            for (_, item) in arrayPlayer.enumerated() {
                print ("\(item.namePlayer)?")
                item.statsOfFights()
            }
        }
        
        // lauch the magic box randomly
        // Magic Potion or Magic Mushroom or Grenade
        func magicBox(character: Character) {
            let random = arc4random_uniform(100)
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
        }
        
        func battleDesignated(ind:Int,opponentPlayer:Player,character:Character) {
            opponentPlayer.statsOfFights() // show the opposite stats of fights of the player's characters
            print("\(ind+1) Please choose someone of the opposit team to fight with.")
            let myTargetCharacter = opponentPlayer.arrayCharacter[characterChoice() - 1]
            character.fight(targetCharacter: myTargetCharacter)
            print ("Name : \(character.type) \(character.nameCharacter)   Defense points :\(character.defensePoints)\nName : \(myTargetCharacter.type)    Defense points: \(myTargetCharacter.nameCharacter)")
        }
        
        
        
        
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
                            return true
                        }
                    }
                }
            }
            return false
        }
        
        
        // introduction
        func start() {
            print ("Let's start the game!")
        }
        
        
        /*
         // Show the 2 players
         for i in 0..<arrayPlayer.count {
         print ("\(i+1) \(Player(namePlayer: playerName))")
         }
         
         func nameYourPlayer() {
         for (_, item) in arrayPlayer.enumerated() {
         print ("What's your name ?")
         var playerName = ""
         let player = Player(namePlayer: playerName)
         repeat {
         if let name = readLine() {
         playerName = name
         }
         } while playerName == ""
         
         print ("Hello \(item.namePlayer)!")
         arrayPlayer.append(Player(namePlayer: playerName))
         player.createYourTeam()
         }
         }
         
         
         // name players
         func namePlayers() {
         let name = ""
         repeat {
         if let strData = readLine() {
         let    name = strData
         print("Hello \(name)")
         }
         } while name != ""
         }
         
         print("Let's play with : ")
         for (i, item) in arrayPlayer.enumerated() {
         print ("\(i+1) \(item.namePlayer)")
         }
         //
         }
         */
        
        // to cure or to fight character vs character
        func battle() {
            showThe2Teams() // this func is showing the 2 teams' stats of fights
            var currentCharacter:Character
            repeat {
                for (i, item) in arrayPlayer.enumerated() {
                    //  let currentTeam = arrayPlayer[i]
                    print("\(item.namePlayer), it's your turn : ")
                    print("\n")
                    print("\(item.namePlayer) please choose one of your characters to start the battle, typing a number between 1 and 3")
                    item.statsOfFights()
                    currentCharacter = item.arrayCharacter[characterChoice() - 1]
                    // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                    magicBox(character: currentCharacter) // launch the magic box with 3 new weapons inside (depending on the type of character)
                    //  magicElixir(ind:i, currentPlayer:currentTeam, character:currentCharacter )
                    if let magus = currentCharacter as? Magus{ // to verifie if the current character chose is a Magus or not => It's an optional because maybe the player wouldn't choose a Magus to create his team
                        item.statsOfFights() // show the stats of fights
                        print("\(i+1) \(item.namePlayer), choose someone of your team to cure him")
                        magus.cure(character: item.arrayCharacter[characterChoice() - 1])
                        // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                    } else {
                        let targetTeam = arrayPlayer[i+1]
                        battleDesignated( ind:i, opponentPlayer:targetTeam, character:currentCharacter)
                    }
                }
            } while !playerLost()
        }
        
        
        func playGame() {
            // Intro
            print("WELCOME TO THE MAGIC WORLD")
            // Game description
            // Setting up the game
            // 1) Name the 2 players
            settingUpTheGame()
            createYourTeam()
            // print ("Hello \(item.namePlayer)")
            // create teams
            // fighting phase
            battle()
            //End of game
        }
        
        func settingUpTheGame() {
            for i in 0..<2 {
                print ("Hello player \(i+1)")
                _ = nameYourPlayer()
            }
        }
        
        func nameYourPlayer() -> Player {
            print ("What's your name ?")
            var playerName = ""
            repeat {
                if let name = readLine() {
                    playerName = name
                }
            } while playerName == ""
            print ("Hello \(playerName)")
            let player = Player(namePlayer: playerName)
            arrayPlayer.append(Player(namePlayer: playerName))
            print("_________________________________________________")
            return player
        }
        
        
        
        
} // End of class Game











