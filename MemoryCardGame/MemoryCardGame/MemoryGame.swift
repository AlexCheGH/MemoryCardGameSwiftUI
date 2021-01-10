//
//  MemoryGame.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/10/21.
//

import Foundation


struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chose: \(card )")
    }
    
    
    init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
            for pairIndex in 0..<numberOfCardPairs {
                
                let content = cardContentFactory(pairIndex)
                
                cards.append(Card(id: pairIndex*2, content: content))
                cards.append(Card(id: pairIndex*2+1, content: content))
                
        }
    }
    
    
    struct Card: Identifiable {
        var id: Int  //needs for Lists, forEach
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        
        var content: CardContent //no matter what the content will be. It'll be told to the system when initializing the object
    }
    
}
