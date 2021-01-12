//
//  MemoryGame.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/10/21.
//

import Foundation


struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chose: \(card )")
        
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp //changing directly, creating "let" will create a copy, not the original

    }
    
    func index(of card: Card) -> Int {
        
        for index in 0..<self.cards.count {
            if card.id == self.cards[index].id {
                return index
            }
        }
        return Int()
        
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
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        
        var content: CardContent //no matter what the content will be. It'll be told to the system when initializing the object
        
         
    }
    
}
