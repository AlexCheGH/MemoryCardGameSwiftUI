//
//  MemoryCardGameApp.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/9/21.
//

import SwiftUI

@main
struct MemoryCardGameApp: App {
    
    let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            GameView(viewModel: game)
        }
    }
}
