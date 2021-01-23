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
    
    @State private var bonusTime: Double = 0
    
    private func startBonusTimeAnimation() {
        bonusTime = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            bonusTime = 0
        }
    }
    
    // MARK:- Body building functions
    @ViewBuilder
    func body(for size: CGSize) -> some View {
        
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: -bonusTime * 360 - 90))
                            .onAppear { startBonusTimeAnimation() }
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: -card.bonusRemaining * 360 - 90))
                    }
                }
                .foregroundColor(.orange)
                .opacity(0.5)
                
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontMultiplier
    }
}
