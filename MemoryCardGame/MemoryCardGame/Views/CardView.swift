//
//  CardView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/17/21.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    let cornerRadius: CGFloat = 10
    let lineWidth: CGFloat = 3
    let fontMultiplier: CGFloat = 0.75
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    // MARK:- Body building functions
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.orange)
                Text(card.content)
            } else if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.orange)
            }
            
            if card.isMatched {
                
            }
            
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontMultiplier
    }
}
