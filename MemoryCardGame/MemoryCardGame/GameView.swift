//
//  GameView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/9/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear) {
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            Button("New Game") {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            }
            .padding()
            .border(Color.black, width: 2)
        }
    }
}




struct CardView: View {
    
    
    
    var card: MemoryGame<String>.Card
    private let fontMultiplier: CGFloat = 0.7
    
    var body: some View {
        
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var bonusTimeRemaining: Double = 0
    
    private func startBonusTime() {
        bonusTimeRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            bonusTimeRemaining = 0
        }
    }
    
    // MARK:- Body building functions
    @ViewBuilder // no need to add else statement
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: -bonusTimeRemaining * 360 - 90))
                            .onAppear {
                                startBonusTime()
                            }
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: -card.bonusRemaining*360-90))
                    }
                }
                .padding(5)
                .foregroundColor(.orange)
                .opacity(0.5)

                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle(degrees: (card.isMatched ? 360 : 0)))
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return GameView(viewModel: game)
    }
}
