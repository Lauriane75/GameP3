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
        print("Choose a character by typing a number between 1 and 4 ")
        print("**********************************************************************")
        print("1 = Fighter   - Defense: 100 - Attack: 10    - Magic Healing: 0")
        print("2 = Magus     - Defense: 300 - Attack: 0     - Magic Healing: +50")
        print("3 = Colossus  - Defense: 400 - Attack: 5     - Magic Healing: 0")
        print("4 = Dwarft    - Defense: 70  - Attack  : 50  - Magic Healing: 0")
        print("**********************************************************************\n")
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
            print("Who is going to recover the treasure ?")
            for (_, item) in arrayPlayer.enumerated() {
                print ("\(item.namePlayer)?")
                item.statsOfFights()
            }
        }
        
    // launch the magic box randomly
    // Magic Potion or Magic Mushroom or Grenade
    func magicBox(character: Character) {
        let random = arc4random_uniform(70)
        if character.defensePoints >= 1 {
            if random <= 20 {
                if character is Magus {
                    print("Crazy! You've found a magic potion!")
                    print("Only a magus can give this potion to one of your buddy. It will give 100% of his defense points\n")
                    let newWeapon = MagicPotion()
                    character.weapon = newWeapon
                    // the character becomes a GiantDwarf
                } else if character is Dwarf {
                    print("You've found a magic mushroom")
                    print("Only Dwarfs like to eat it because it makes them much taller and bigger.")
                    print("Now you will transform to a giant dwarf and have a full 150 defense points\n")
                    let newWeapon = MagicMushroom()
                    let newCharacter = GiantDwarf(name:character.nameCharacter)
                    character.weapon = newWeapon
                    character.nameCharacter = newCharacter.nameCharacter
                    character.fullLifeBar = newCharacter.fullLifeBar
                    character.defensePoints = newCharacter.defensePoints
                } else { // If the character is a fighter or a Colossus he will find a grenade
                    print ("Wow! You've just dicovered a Grenade!")
                    print("Use it on the enemy and it will take 80 of his defense points.\n")
                    let newWeapon = Grenade()
                    character.weapon = newWeapon
                }
            }
        }
    }
    
    func dead() {
        // To link each arrayPlayer with each arrayCharacter
        for (_, item) in arrayPlayer.enumerated() {
            for (_, it) in item.arrayCharacter.enumerated() {
                if it.defensePoints <= 0 {
                    print ("\(it.nameCharacter) died")
                    let deadCharacter = it
                    item.arrayDeadCharacter.append(deadCharacter)
                    // To filter each dead character from the arrayCharacter
                    _ = item.arrayCharacter.filter { $0.defensePoints <= 0 }
                    }
                }
            }
        }
    
    func playerLost() -> Bool {
        for (i, _) in arrayPlayer.enumerated() {
            let player = i == 0 ? arrayPlayer[1] : arrayPlayer[0]
        
            if arrayPlayer[0].arrayDeadCharacter.count == 3 {
                print("\(arrayPlayer[0].namePlayer) has lost")
                print ("GAME OVER \(player.namePlayer)")
                return true
            }
        
            if arrayPlayer[1].arrayDeadCharacter.count == 3 {
                print("\(arrayPlayer[1].namePlayer) has lost")
                print ("GAME OVER \(player.namePlayer)")
                return true
            }
        }
        return false
    }
 
        
        

        // introduction
        func gameRules() {
            print("WELCOME TO THE MAGIC WORLD !\n")
            print ("Once upon a time there was a team of 3 friends who were looking for a treasure that everyone was talking about, but no one had ever find it. This treasure was hiding in a magical and enchanted world. After months and months of quest, they  finally got to find the treasure, full of courage and exhausted. But that day, they were not the only ones. Another mysterious team was already there to seize the treasure.\n")
            print ("In this game, you will create 2 team of 3 players and start battles. Sometimes you will discovered some surprises so pay attention.\n")
            print ("\nNow it's time to fight for the treasure\n Let's start the Game !\n")
        }

    // to cure or to fight character vs character
    func battle() {
        showThe2Teams() // this func is showing the 2 teams' stats of fights
        var currentCharacter:Character
        repeat {
            for (i, item) in arrayPlayer.enumerated() {
                let currentPlayer = item.namePlayer
                
                print("\(item.namePlayer), it's your turn : \n")
                // Player.magicElixir(item.namePlayer)
                //magicElixir(ind:i, player:currentPlayer, character: currentCharacter)
                // to bring a dead character back to life
                print("\(item.namePlayer) please choose one of your characters to start the battle, typing a number between 1 and 3")
                item.statsOfFights()
                currentCharacter = item.arrayCharacter[characterChoice() - 1]
                // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                //Player.zombiePotion(character: Character)
                magicBox(character: currentCharacter) // launch the magic box with 3 new weapons inside (depending on the type of character)
                if let magus = currentCharacter as? Magus{ // to verifie if the current character chose is a Magus or not => It's an optional because maybe the player wouldn't choose a Magus to create his team
                    print("\(item.namePlayer), choose someone of your team to cure him")
                    item.statsOfFights() // show the stats of fights
                    magus.cure(character: item.arrayCharacter[characterChoice() - 1])
                    // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                } else {
                    
                    let targetPlayer = i == 0 ? arrayPlayer[1] : arrayPlayer[0]
                     print("\(currentPlayer) Please choose someone of the opposit team to fight with.")
                    targetPlayer.statsOfFights()
                    let characterTarget = targetPlayer.arrayCharacter[characterChoice() - 1]
                    
                    if currentCharacter.defensePoints > 0 {
                        if characterTarget.defensePoints <= 0 {
                            print("This guy is already over!")
                        } else {
                            characterTarget.defensePoints -= currentCharacter.weapon.injuries  // to take the defense points of the character enemy
                            print(" Your \(currentCharacter.type) \(currentCharacter.nameCharacter) hit the \(characterTarget.type) \(characterTarget.nameCharacter) with his \(currentCharacter.weapon.nameWeapon) taking \(currentCharacter.weapon.injuries) defense points to him.")
                            if characterTarget.defensePoints <= 0 {
                                characterTarget.defensePoints = 0
                                print ("\(characterTarget.type) \(characterTarget.nameCharacter) died")
                                targetPlayer.arrayDeadCharacter.append(characterTarget)
                            }
                        }
                    } else {
                        print("Sorry, \(characterTarget.nameCharacter) needs to be revived! ")
                    }  // fighting in return if the opponent character is still alive
                    
                    if characterTarget.defensePoints > 0 {
                        if currentCharacter.defensePoints <= 0 {
                            print("This guy is already over!")
                        } else {
                            if characterTarget is Magus {
                                print ("Your \(characterTarget.type) \(characterTarget.nameCharacter) doesn't know how to fight.")
                            } else {
                                currentCharacter.defensePoints -= characterTarget.weapon.injuries  // to take the defense points of the character enemy
                                print(" The \(characterTarget.type) \(characterTarget.nameCharacter) hit the \(currentCharacter.type) \(currentCharacter.nameCharacter) with his \(characterTarget.weapon.nameWeapon) taking \(characterTarget.weapon.injuries) defense points to him.")
                                if currentCharacter.defensePoints <= 0 {
                                    currentCharacter.defensePoints = 0
                                    print ("\(currentCharacter.type) \(currentCharacter.nameCharacter) just died")
                                    //currentPlayer.arrayDeadCharacter.append(currentCharacter)
                                } else {
                                print("Sorry, \(currentCharacter.nameCharacter) needs to be revived! ")
                                }
                            }
                        }
                    }
                }
            }
            dead()
        } while !playerLost()
    }
    
        
        func playGame() {
            // Game rules
            gameRules()
            // Setting up the game
            // 1) Name the 2 players
            settingUpTheGame()
            // 2) create teams
            createYourTeam()
            // fighting phase
            battle()
            //End of game
            
            // Show winner = win the treasure
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











