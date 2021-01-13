//
//  MemoryGame.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/10/21.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    
    var faceUpCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } }
    }
    
    mutating func choose(card: Card) {
        
        if let chosenIndex = self.cards.index(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatch = faceUpCardIndex {  // here
                if cards[chosenIndex].content == cards[potentialMatch].content {
                    cards[potentialMatch].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                faceUpCardIndex = chosenIndex // here
            }
        }
    }
    
    init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfCardPairs {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
            
        }
        cards.shuffle()
    }
    
    
    struct Card: Identifiable {
        var id: Int  //needs for Lists, forEach
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //no matter what the content will be. It'll be told to the system when initializing the object
    }
    
}
