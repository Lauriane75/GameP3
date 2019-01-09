//
//  Players.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation


class Player {
    
    var namePlayer: String
  //  var coinsForWinner = 10

    public var arrayCharacter = [Character]() // will create a team of 3 character by player only characters alive
   


    init(namePlayer: String) {
        self.namePlayer = namePlayer
    }
    
  public var arrayDeadCharacter : [Character] = [Character]()

    
  /*  public func arrayDeadCharacter() -> [Character] {
        let deadCharacters = arrayCharacter.filter { $0.defensePoints <= 0 }
        return deadCharacters
    }*/


    
    
   // To show the results of each character
    func statsOfFights() {
        for i in 0..<arrayCharacter.count {
            let character = arrayCharacter[i]
            if character.defensePoints >= 1 {
                if character is Fighter || character is Colossus || character is Dwarf {
                    print("Name : \(i+1) \(character.type) \(character.nameCharacter)\nDefense points : \(character.defensePoints)\nAttack points : \(character.weapon.injuries)")
                } else if character is Magus {
                    print("Name : \(i+1) \(character.type) \(character.nameCharacter)\nDefense points : \(character.defensePoints)\nHealing points : \(character.weapon.healing)")
                }
            } else { // If the character is <= 0
                print("\(i+1) The \(character.type) \(character.nameCharacter), is dead, find something to bring it back to life.")
            }
        }
    }
    
    

    
    func createTeamDescription() {
        print("______________________________________________________")
        print("1 = Fighter   - Defense: 100 - Attack: 10 - Magic Healing: 0")
        print("2 = Magus  - Defense: 300 - Attack: 0 - Magic Healing: +50")
        print("3 = Colossus    - Defense: 400  - Attack: 5 - Magic Healing: 0")
        print("4 = Dwarft  - Defense: 70  - Attack  : 50 - Magic Healing: 0")
        print("______________________________________________________")
        print("Choose a character by typing a number between 1 and 4 ")
    }
    
        
   public func createYourTeam() {
        for _ in 1...3 { // ask 3 times for 3 characters in the team
            var characterChoice  = 0
            repeat {
                createTeamDescription()   // call the function describing character's properties
                if let strData = readLine() {
                    if let strData = Int(strData) {
                        characterChoice = strData
                    }
                }
            } while characterChoice < 1 && characterChoice > 4
            let nameYourCharacter = UniqueName.single.uniqueCharacterNames()
           
            switch characterChoice { 
            case 1:
            print("You chose a Fighter")
            arrayCharacter.append(Fighter(name: nameYourCharacter))
            case 2:
            print("You chose a Magus.")
            arrayCharacter.append(Magus(name: nameYourCharacter))
            case 3:
            print("You chose a Colossus.")
            arrayCharacter.append(Colossus(name: nameYourCharacter))
            case 4:
            print("You chose a Dwarf.")
            arrayCharacter.append(Dwarf(name: nameYourCharacter))
            default:
            return
            }
        }

 

    func zombiePotion(character: Character) {
        let random = arc4random_uniform(100)
        if character.defensePoints >= 1 {
            if random <= 40 {
                print ("You've just found a Zombie Potion!\nUse it to bring your last dead budy back to life and transform him in a walking dead")
                showDeadCharacters()
                var dead = lastDeadCharacter()
                if dead != nil {
                    dead = WalkingDead(name:lastDeadCharacter()?.nameCharacter ?? "Zombie")
                    print ("Great ! Your \(String(describing: lastDeadCharacter()?.type)) \(String(describing: lastDeadCharacter()?.nameCharacter)) got back to life and has transformed in zombie ")
                    _ = dead
                    print("Welcome to your new character \(String(describing: lastDeadCharacter()?.nameCharacter)) the walking dead")
                } else {
                    print ("Sorry you don't have any dead guy.")
                }
            }
            
        }
    }
    
    func magicElixir(ind:Int,currentPlayer:Player,character:Character) {
        let random = arc4random_uniform(100)
        if character.defensePoints >= 1 {
            if random <= 25 {
                print ("You've just found an Elixir!\nUse it to bring your last dead budy back to life")
                showDeadCharacters()
                if lastDeadCharacter() != nil {
                    lastDeadCharacter()?.defensePoints = character.fullLifeBar
                    print ("Great ! Your \(String(describing: lastDeadCharacter()?.type)) \(String(describing: lastDeadCharacter()?.nameCharacter)) got back to life! ")
                } else {
                    print ("Sorry you don't have any dead guy.")
                }
            }
        }
    }
    
    func lastDeadCharacter() -> Character? {
        return arrayDeadCharacter.last
    }
}
   
    // To show dead characters of each player
    func showDeadCharacters() {
        print ("Here are all the dead characters")
        for (_, it) in arrayDeadCharacter.enumerated() {
            print ("Name: \(it.nameCharacter)\nType: \(it.type)\nDefense: \(it.defensePoints)\nAttack: \(it.attackPoints)")
        }
    }
    

    
} // End of Player class
   
    



    

        
   
    
    


