//
//  GameView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/9/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    @ObservedObject var themeName = GameThemeManager()
    
    var body: some View {
        UpperGameView(score: $viewModel.score,
                      themeName: $themeName.currentTheme,
                      action: {
                        viewModel.refresh(randomly: true)
                      })
            .frame(width: UIScreen.main.bounds.width - 10,
                   height: 80)
        VStack {
            Grid(items: viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        
                        withAnimation(.linear) {
                            viewModel.choose(card: card) }
                    }
                    .padding(5)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        GameView(viewModel: game)
    }
}
