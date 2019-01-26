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
    
    // introduction
    func gameRules() {
        print("       *********************************")
        print("       *  WELCOME TO THE MAGIC WORLD ! * ")
        print("       *********************************")
        print ("Once upon a time there was a team of 3 friends who were looking for a treasure that everyone was talking about, but no one had ever find it. This treasure was hiding in a magical and enchanted world. After months and months of quest, they  finally got to find the treasure, full of courage and exhausted. But that day, they were not the only ones. Another mysterious team was already there to seize the treasure.\n")
        print ("Game Rules : In this game, you will create 2 teams of 3 players and start battles. Sometimes you will discover some surprises so pay attention.\n")
        print ("\nNow it's time to fight for the treasure\n Let's start the Game !\n")
    }

    
    func createTeamDescription() {
        print("Choose a character by typing a number between 1 et 4")
        print("*********************************************************************")
        print("1 = Fighter   - Defense: 100 - Attack: 10    - Magic Healing: 0")
        print("2 = Magus     - Defense: 300 - Attack: 0     - Magic Healing: +50")
        print("3 = Colossus  - Defense: 400 - Attack: 5     - Magic Healing: 0")
        print("4 = Dwarft    - Defense: 70  - Attack  : 50  - Magic Healing: 0")
        print("*********************************************************************\n")
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
    
    
    func createYourTeam() {
        print ("OK, let's create your team ! \n")
        for (_, item) in arrayPlayer.enumerated() {
            print ("\(item.namePlayer) please ?")
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
            print("Perfect! You are fine.\n")
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
        
    // launch the magic box randomly and find Magic Potion or Magic Mushroom or Grenade
    func magicBox(character: Character, player: Player){
        let random = arc4random_uniform(100)
        if character.defensePoints >= 1 {
            if random <= 25 {
                print ("+++++++++++++")
                print ("+ Magic Box +")
                print ("+++++++++++++")
                if character is Magus {
                    // the Magus can cure 100 defense points
                    if character.weapon is MagicHealing {
                        let newWeapon = MagicPotion()
                        print("Crazy! \(character.nameCharacter) has found a magic potion!\nOnly a magus can give this potion to one of your buddy. It will give 100 defense points to him.\n")
                        character.weapon = newWeapon
                    } else if character.weapon is MagicPotion {
                        print ("\(character.nameCharacter), has already a superpower)")
                    }
                } else if character is Dwarf {
                      // the Dwarf becomes a GiantDwarf
                    print("\(character.nameCharacter)'s found a magic mushroom\nOnly Dwarfs like to eat it because it makes them much taller and bigger.")
                    print("Now \(character.nameCharacter) will transform to a Giant Dwarf recover a full 150 defense points\n")
                    character.defensePoints = 0
                    let newCharacter = GiantDwarf(name:character.nameCharacter)
                    _ = newCharacter
                    player.arrayCharacter.append(newCharacter)
                } else if character is Colossus || character is Fighter || character is WalkingDead || character is GiantDwarf {
                    // If the character is a Fighter or a Colossus or a Walking Dead he will find a grenade and attack for 80 points
                 if character.weapon is Hammer || character.weapon is Sword || character.weapon is Bite || character.weapon is Axe {
                    print ("Wow! \(character.nameCharacter) has just dicovered a Grenade!")
                    print("Use it on the enemy and it will take 80 of his defense points.\n")
                    let newWeapon = Grenade()
                    character.weapon = newWeapon
                 } else if character.weapon is Grenade {
                     print ("\(character.nameCharacter) has already a grenade")
                    }
                }
            }
        }
        player.arrayCharacter = player.arrayCharacter.filter{ $0.defensePoints > 0 }
    }
    
    
    func playerLost() -> Bool {
        for _ in arrayPlayer {
        
            if arrayPlayer[0].arrayCharacter.count == 0 {
                let winner = arrayPlayer[1]
                let looser = arrayPlayer[0]
                print("\(looser.namePlayer) has lost")
                print ("GAME OVER \(looser.namePlayer)")
                print ("Congratulations \(winner.namePlayer)'s team is winning the treasure !")
                
                return true
            }
        
            else if arrayPlayer[1].arrayCharacter.count == 0 {
                let winner = arrayPlayer[0]
                let looser = arrayPlayer[1]
                print("\(looser.namePlayer) has lost")
                print ("GAME OVER \(looser.namePlayer)")
                print ("Congratulations \(winner.namePlayer)'s team is winning the treasure !")
                
                return true
            } 
        }
        return false
    }
 
    

    // to cure or to fight character vs character
    func battle() {
        showThe2Teams() // this func is showing the 2 teams' stats of fights
        var currentCharacter:Character
        repeat {
            for (i, item) in arrayPlayer.enumerated() {
                let currentPlayer = item.namePlayer
                
                print("\(item.namePlayer), it's your turn : \n")
                //call the Magic Elixir randomly to bring a dead character back to life
                item.magicElixir()
                print("\(item.namePlayer) please choose one of your characters to start the battle, typing his number")
                item.statsOfFights()
                // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                currentCharacter = item.arrayCharacter[item.characterChoice()-1]
                // la on a exactement le nombre d'item ds le tableau
                
                // call the zombie potion randomly to bring a dead character back to life and transform him in a walking dead newcharacter
                item.zombiePotion(character:currentCharacter)
                // launch the magic box with 3 new weapons inside = depending on the type of character
                magicBox(character: currentCharacter, player: item)
                if let magus = currentCharacter as? Magus{ // to verifie if the current character chose is a Magus or not => It's an optional because maybe the player wouldn't choose a Magus to create his team
                    print("\(item.namePlayer), choose someone of your team to cure him.\nBe careful you can't cure yourself")
                    item.statsOfFights() // show the stats of fights
                    magus.cure(character: item.arrayCharacter[item.characterChoice()-1])
                    // -1 because the index start at 0 so if I choose 1 it's gonna be the #O in i
                } else {
                    
                    let targetPlayer = i == 0 ? arrayPlayer[1] : arrayPlayer[0]
                     print("\(currentPlayer) Please choose someone of the opposit team to fight with.")
                    targetPlayer.statsOfFights()
                    let characterTarget = targetPlayer.arrayCharacter[targetPlayer.characterChoice()-1]
                
                        //if characterTarget.defensePoints <= 0 {
                        //    print("This guy is already over!")
                        if currentCharacter.defensePoints > 0 {
                            characterTarget.defensePoints -= currentCharacter.weapon.injuries  // to take the defense points of the character enemy
                            print(" Your \(currentCharacter.type) \(currentCharacter.nameCharacter) hit the \(characterTarget.type) \(characterTarget.nameCharacter) with his \(currentCharacter.weapon.nameWeapon) taking \(currentCharacter.weapon.injuries) defense points to him.")
                            // if the target character is still alive
                            if characterTarget.defensePoints <= 0 {
                                characterTarget.defensePoints = 0
                                print ("\(characterTarget.type) \(characterTarget.nameCharacter) died")
                                targetPlayer.arrayDeadCharacter.append(characterTarget)
                                targetPlayer.arrayCharacter = targetPlayer.arrayCharacter.filter { $0.defensePoints > 0 }
                            } else {
                        print("Sorry, \(characterTarget.nameCharacter) needs to be revived! ")
                    }
                            // fighting in return if the opponent character is still alive
                            if characterTarget.defensePoints > 0 {
                            if characterTarget is Magus {
                                print ("Your \(characterTarget.type) \(characterTarget.nameCharacter) doesn't know how to fight.")
                            } else {
                                currentCharacter.defensePoints -= characterTarget.weapon.injuries  // to take the defense points of the character enemy
                                print(" The \(characterTarget.type) \(characterTarget.nameCharacter) hit the \(currentCharacter.type) \(currentCharacter.nameCharacter) with his \(characterTarget.weapon.nameWeapon) taking \(characterTarget.weapon.injuries) defense points to him.")
                                if currentCharacter.defensePoints <= 0 {
                                    currentCharacter.defensePoints = 0
                                    print ("\(currentCharacter.type) \(currentCharacter.nameCharacter) just died")
                                    item.arrayDeadCharacter.append(currentCharacter)
                                     item.arrayCharacter = item.arrayCharacter.filter { $0.defensePoints > 0 }
                                }
                            }
                        }
                    }
                }
            }
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
        
 
        
        
        
} // End of class Game











