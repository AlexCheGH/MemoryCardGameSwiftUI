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
        HStack {
            Grid(items: viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture { viewModel.choose(card: card) }
                    .padding(5)
            }
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
    
    
    
    // MARK:- Body building functions
    @ViewBuilder // no need to add else statement
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endangle: Angle(degrees: 110-90))
                    .padding(5)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return GameView(viewModel: game)
    }
}
