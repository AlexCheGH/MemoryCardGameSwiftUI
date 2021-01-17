//
//  MemoryCardGameApp.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/9/21.
//

import SwiftUI

@main
struct MemoryCardGameApp: App {
    
//    let game = EmojiMemoryGame()
    let themes = GameTheme.allCases
    
    var body: some Scene {
        WindowGroup {
            GameThemeView()
//            GameView(viewModel: game)
        }
    }
}
