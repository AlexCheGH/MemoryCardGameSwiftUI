//
//  EmojiMemoryGame.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/10/21.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    //Model. Closed for everything but selfClass
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame() //sending notifications to view
    
    //static to init the game
    static func createMemoryGame() -> MemoryGame<String> {
        
        let emojiSet = GameThemeManager().getEmojiSet()
        let emojis = emojiSet.shuffled()
        let randomNumberOfPairs = Int.random(in: 3..<5)
        
        return MemoryGame<String>(numberOfCardPairs: randomNumberOfPairs) { pair in
            emojis[pair]
        }
    }
    
    func refresh(randomly randomTheme: Bool = false) {
        if randomTheme {
            GameThemeManager().setRandomTheme()
        }
        game = EmojiMemoryGame.createMemoryGame()
    }
    
    // Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    var score: Int {
        get { game.score }
        set {  }
    }
    
    //Intents
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
        //        objectWillChange.send()
    }
    
    
}
