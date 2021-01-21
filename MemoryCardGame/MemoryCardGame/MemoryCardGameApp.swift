//
//  MemoryCardGameApp.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/9/21.
//

import SwiftUI

@main
struct MemoryCardGameApp: App {

    let themes = GameTheme.allCases
    
    var body: some Scene {
        WindowGroup {
            GameThemeView()
        }
    }
}
