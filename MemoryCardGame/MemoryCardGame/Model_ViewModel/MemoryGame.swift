//
//  MemoryGame.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/10/21.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    
    var cards: Array<Card>
    var score: Int
    
    var faceUpCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } } //faces down the rest of the cards
    }
    
    mutating func choose(card: Card) {
        
        if let chosenIndex = self.cards.index(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatch = faceUpCardIndex {
                if cards[chosenIndex].content == cards[potentialMatch].content {
                    cards[potentialMatch].isMatched = true
                    cards[chosenIndex].isMatched = true
                    
                    cards[potentialMatch].isMismatched = false
                    cards[chosenIndex].isMismatched = false
                    
                    addScore()
                }
                cards[chosenIndex].isFaceUp = true
                
                if cards[chosenIndex].isMismatched { subtractScore() }
                cards[chosenIndex].isMismatched = true
                
            } else {
                faceUpCardIndex = chosenIndex
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
        score = 0
    }
    
    private mutating func addScore() {
        score += 2
    }
    
    private mutating func subtractScore() {
        if score >= 1 {
            score -= 1
        }
    }
    
    
    struct Card: Identifiable {
        var id: Int  //needs for Lists, forEach
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isMismatched: Bool = false
        var content: CardContent //no matter what the content will be. It'll be told to the system when initializing the object
    }
    
}
