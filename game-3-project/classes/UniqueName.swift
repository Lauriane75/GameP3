//
//  UniqueName.swift
//  game-3-project
//
//  Created by Lauriane Haydari on 09/01/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import Foundation

// To check if the name chose is a unique available
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
                charactersNameArray.append(nameYourCharacter) // if not the name can be added to the character's name array
                print("Ok!")
            }
        } while nameYourCharacter == ""
        return nameYourCharacter
    }
}
// End of class UniqueName

