//
//  UserPreferences.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/17/21.
//

import Foundation

class UserPreferences {
    
    private let themeKey = "emoji"
    
    func savePreference(_ theme: String) {
        UserDefaults.standard.setValue(theme, forKey: themeKey)
    }
    
    func getEmojiSet() -> [String] {
        checkPreference()
        
        let named = UserDefaults.standard.string(forKey: themeKey)
        switch named {
        case GameTheme.halloween.rawValue:
            return ["🎃", "🧛‍♂️", "🧟‍♂️", "🌕", "👻", "🕯️", "🍬"]
        case GameTheme.newYear.rawValue:
            return ["🎉", "⛄️", "🎅", "❄️", "🎁", "⛷", "🌡"]
        case GameTheme.easter.rawValue:
            return ["🥚", "🐰", "🎁", "🎉", "🎩", "🌈", "🍀"]
        case GameTheme.summer.rawValue:
            return ["☀️", "🕶", "🌇", "🏊‍♂️", "🍃", "🌊", "⛵️"]
        case GameTheme.spring.rawValue:
            return ["🍀", "🌈", "🌷", "🐰", "🌦", "🌻", "🌇"]
        case GameTheme.space.rawValue:
            return ["👽", "👾", "🤖", "🦾", "🚀", "🌑", "👓"]
        default: return ["🎃", "🧛‍♂️", "🧟‍♂️", "🌕", "👻", "🕯️", "🍬"]
        }
    }
    
    private func checkPreference() {
        let themeSet = UserDefaults.standard.string(forKey: themeKey)
        
        if themeSet == nil {
            let defaultSet = GameTheme.halloween.rawValue
            UserDefaults.standard.set(defaultSet, forKey: themeKey)
        }
    }
    
}
