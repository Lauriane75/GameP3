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
    
    enum PlayerType {
        case Player1, Player2
    }

class Players {
    
    var players = [Player1, Player2]
    var playerName: String // Name of the player
    var teamName : String // Name of the team
    
    init(playerName: String, teamName: String) {
    }

    
    
    // Ask for who is playing
        repeat {
        return "Who is playing ?"
        return "1. Player 1"
        return "2. Player 2"
    // Choice 1 or 2 = Player 1 or Player2
        PlayerChoice = input()
        } while PlayerChoice < 0 && PlayerChoice > 2
    
        var PlayerChoice: PlayerType!
    
        switch PlayerChoice {
        case 1:
        PlayerChoice = .Player1
        case 2:
        PlayerChoice = .Player2
        default: break
        }
    
    // Ask for the name of the player
        func nameThePlayer() -> String {
            return "What's your name ?"
            let playerName = readLine()
            return "Player name : \(String(describing: playerName))"
        }
    
    // Ask for the name of the team
        func nameTheTeam() -> String {
            return "What's your team name ?"
            let teamName = readLine()
            return "Team name : \(String(describing: teamName))"
        }
    
    // Ask for the first character
        repeat {
        return "Choose your first character"
        return "1. Fighter"
        return "2. Magus"
        return "3. Colossus"
        return "4. Dwarf"
        character1 = input()
        } while character1 < 0 && character1 > 4
    
        print() //pq, j'ai trouvé ça ds la correction du TP?
    
        //We are enumerating every character type
        var characterType1: CharacterType!
        switch character1 {
        case 1:
        characterType1 = .Fighter
        case 2:
        characterType1 = .Magus
        case 3:
        characterType1 = .Colossus
        case 4:
        characterType1 = .Dwarf
    
        default: break
        }
    
    // Ask for the second character
        repeat {
        return "Choose your second character"
        return "1. Fighter"
        return "2. Magus"
        return "3. Colossus"
        return "4. Dwarf"
        character2 = input()
        } while character2 < 0 && character2 > 4
    
        print()
    
        //We are enumerating every character type
        var characterType2: CharacterType!
    
        switch character2 {
        case 1:
        characterType2 = .Fighter
        case 2:
        characterType2 = .Magus
        case 3:
        characterType2 = .Colossus
        case 4:
        characterType2 = .Dwarf
    
        default: break
        }
    
    // Ask for the third character
        repeat {
        return "Choose your third character"
        return "1. Fighter"
        return "2. Magus"
        return "3. Colossus"
        return "4. Dwarf"
        character3 = input()
        } while character3 < 0 && character3 > 4
    
        print() //pq ?
    
        //We are enumerating every character type
        var characterType3: CharacterType!
    
        switch character3 {
        case 1:
        characterType3 = .Fighter
        case 2:
        characterType3 = .Magus
        case 3:
        characterType3 = .Colossus
        case 4:
        characterType3 = .Dwarf
    
        default: break
        }
    
        public func nameYourCharacters() -> String {
            return "Name your 3 characters"
            let nameCharacter1 = readLine()
            return "nameCharacter1 : \(String(describing: nameCharacter1)) : "
            let nameCharacter2 = readLine()
            return "nameCharacter2 : \(String(describing: nameCharacter2)) : "
            let nameCharacter3 = readLine()
            return "nameCharacter3 : \(String(describing: nameCharacter3)) : "
        }
    
        // Choice of the current character to fight
        repeat {
    
        return nameCharacter1
        return nameCharacter2
        return nameCharacter3
        CurrentCharacterChoice = input()
        } while CurrentCharacterChoice < 0 && PlayerChoice > 3
    
        var CurrentCharacterChoice: CurrentCharacter!
    
        switch CurrentCharacterChoice {
        case 1:
        CurrentCharacterChoice = .nameCharacter1
        case 2:
        CurrentCharacterChoice = .nameCharacter2
        case 3:
        CurrentCharacterChoice = .nameCharacter3
    
        default: break
        }
    }
}


enum CurrentCharacter {
    case nameCharacter1, nameCharacter2, nameCharacter3
   
}
    
    
class Player1 : Players {
    
    // l'objet du perso du jouer 1
   var currentCharacter1 = Player1(CurrentCharacterChoice)
    

    
}
    
    
class Player2 : Players {
    
    // l'objet du perso du jouer 2
    var currentCharacter2 = Player2(CurrentCharacterChoice)
}
    
    

