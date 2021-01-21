//
//  CardView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/17/21.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    
   private let cornerRadius: CGFloat = 10
   private let lineWidth: CGFloat = 3
   private let fontMultiplier: CGFloat = 0.75
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    // MARK:- Body building functions
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endangle: Angle(degrees: 110-90))
                    .foregroundColor(.orange)
                    .opacity(0.5)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontMultiplier
    }
}
