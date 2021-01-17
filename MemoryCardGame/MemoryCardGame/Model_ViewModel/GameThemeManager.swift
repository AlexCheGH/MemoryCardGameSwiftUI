//
//  UserPreferences.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/17/21.
//

import Foundation


enum GameTheme: String, CaseIterable {
    
    case halloween = "Halloween"
    case newYear = "New Year"
    case easter = "Easter"
    case summer = "Summer"
    case spring = "Spring"
    case space = "Space"
}



class GameThemeManager: ObservableObject {
    
    @Published var currentTheme = GameThemeManager.getCurrentThemeName()
    private static let themeKey = "emoji"
    
    func savePreference(_ theme: String) {
        UserDefaults.standard.setValue(theme, forKey: GameThemeManager.themeKey)
    }
    
    func getEmojiSet() -> [String] {
        checkPreference()
        
        let named = UserDefaults.standard.string(forKey: GameThemeManager.themeKey)
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
    
    static func getCurrentThemeName() -> String? {
        return UserDefaults.standard.string(forKey: themeKey)
    }
    
    private func checkPreference() {
        let themeSet = UserDefaults.standard.string(forKey: GameThemeManager.themeKey)
        
        if themeSet == nil {
            let defaultSet = GameTheme.halloween.rawValue
            UserDefaults.standard.set(defaultSet, forKey: GameThemeManager.themeKey)
        }
    }
    
    func setRandomTheme() {
        let randomKey = GameTheme.allCases.randomElement()?.rawValue
        self.savePreference(randomKey!)
    }
    
}
