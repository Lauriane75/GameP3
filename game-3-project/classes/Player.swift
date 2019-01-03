//
//  Players.swift
//  mini-game
//
//  Created by Lauriane Haydari on 12/12/2018.
//  Copyright © 2018 Lauriane Haydari. All rights reserved.
//

import Foundation

func input() -> Int {
    let strData = readLine();
    
    return Int(strData!)!
}
    



class Player {
    
    var namePlayer: String
  //  var coinsForWinner = 10

    public var arrayCharacter = [Character]() // will create a team of 3 character by player

    
    init(namePlayer: String) {
        self.namePlayer = namePlayer
    }
    
    public var arrayDeadCharacter : [Character] = [Character]()

    
    // The elixir will appear randomly and permit to the player to bring one of his dead character to life
    func elixir(character: Character) {
        let random = arc4random_uniform(<#UInt32#>)
        if character.defensePoints >= 1 {
            if random <= 25 {
                print ("You've just found an Elixir! \n Use it to bring one of your dead budy back to life")
                //  let deadCharacter? = arrayDeadCharacter
                
                print ("choose one of your dead character to revived him")
                
                    for i in 0..<arrayDeadCharacter.count {
                        print ("Choice \(i+1) \(arrayDeadCharacter.startIndex)")
                    }
                // comment chosir le character à réanimer
             // let newCharacter = WalkingDead(name:character.nameCharacter)
                }
            }
        }
    
    // To check each dead character add them to the arrayDeadCharacter
    func theCharacterIsDead() -> Bool {
        var dead = false
        for character in arrayCharacter {
            let deadCharacter = character
            if character.defensePoints <= 0 {
                dead = true
                print("The \(character.type) \(character.nameCharacter) is dead.")
                arrayDeadCharacter.append(deadCharacter)
                // deleteDeadCharacter()
            } else {
                return false
                print ("No ones died")
        }
    }
    return dead
}

    // To delete the dead characters in the arrayCharacter
    func deleteDeadCharacter() {
        for deadCharacter in arrayDeadCharacter {
            print("Here are heroes dead: \(deadCharacter.nameCharacter)")
         // if let index = arrayCharacter.index(of:deadCharacter) {
                print("Found heroe dead at index \(index)")
              //  arrayDeadCharacter.remove(at: index)
        }
    }

   
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
        print("")
        print("==============================================================")
        print("1 - Fighter   - Defense: 100 - Attack: 10 - Magic Healing: +0")
        print("2 - Magus  - Defense: 300 - Attack: 0 - Magic Healing: +50")
        print("3 - Colossus    - Defense: 400  - Attack: 5 - Magic Healing: +0")
        print("4 - Dwarft  - Defense: 50  - Attack  : 50 - Magic Healing: +0")
        print("==============================================================")
        print("Choose a character by typing a number between 1 and 4 ========")
    }
    
        
        
   public func createYourTeam() {
        for _ in 1...3 { // ask 3 times for 3 characters in the team
            let characterChoice = input()
            repeat {
                createTeamDescription()   // call the function describing character's properties
        
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
    

    
} // End of Player class
   
    
// To check oi the name chose is a unique available
class UniqueName {
        var charactersNameArray = [String]()
        static let single = UniqueName()
        
        func uniqueCharacterNames() -> String {
            var nameYourCharacter = ""
            repeat {
                print("What's your character's name : ")
                nameYourCharacter = readLine()!
               
                    if charactersNameArray.contains(nameYourCharacter) { // if the array already contains the same name
                        print("This character's name '\(nameYourCharacter)' does already exist. Can you find a new name ?")
                        nameYourCharacter = readLine()!
                    } else {
                        charactersNameArray.append(nameYourCharacter) // if not, the name can be added to the character's name array
                        print("Perfect! You are fine. ")
                    }
            } while nameYourCharacter == ""
            return nameYourCharacter
        }
    }
}
    
    

        
   
    
    


