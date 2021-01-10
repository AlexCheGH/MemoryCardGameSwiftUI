//
//  EmojiMemoryGame.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/10/21.
//

import SwiftUI


class EmojiMemoryGame {
    
   //Model. Closed for everything but selfClass
    private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    
    //static to init the game
   static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🎲", "🎃", "🩺", "💵", "🏳️‍🌈", "😇", "🧶"]
        
       return MemoryGame<String>(numberOfCardPairs: 3) { pair in
            emojis[pair]
        }
    }
    
    // Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    //Intents
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
        
        
    }
    
    
}
