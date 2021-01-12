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
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture { viewModel.choose(card: card) }
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        
        .font( viewModel.cards.count == 10 ? .body : .largeTitle )
    }
}




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
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.orange)
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontMultiplier
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        GameView(viewModel: game)
    }
}
