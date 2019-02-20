//
//  game.swift
//  apple_pie_Lab_2_7
//
//  Created by Anna CS on 2/12/19.
//  Copyright © 2019 Anna Lopez. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String{
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }

}
