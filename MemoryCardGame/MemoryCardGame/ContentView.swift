//
//  ContentView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture { viewModel.choose(card: card) }
            }
        }
        .padding()
        .aspectRatio(2/3, contentMode: .fit)
        .font( viewModel.cards.count == 10 ? .body : .largeTitle )
    }
}




struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        let cornerRadius:CGFloat = 10
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.orange)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.orange)
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
