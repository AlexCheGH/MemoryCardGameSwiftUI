//
//  GameThemeView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/14/21.
//

import SwiftUI

struct GameThemeView: View {
    
    @ObservedObject var gameModel = EmojiMemoryGame()
    let data = Theme()
    
    @State var isReady = false
    
    var body: some View {
        
        
        VStack {
            makeTexts()
        }
        
        .navigate(to: GameView(viewModel: gameModel), when: $isReady)
        
        
    }
    
    func makeTexts() -> some View {
        VStack{
            ForEach (0..<data.themes.count, id: \.self) { index in
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 3)
                    RoundedRectangle(cornerRadius: 10)
                        .fill()
                        .foregroundColor(.orange)
                    Text(data.themes[index].rawValue)
                        .font(.largeTitle)
                    
                }
                .onTapGesture(count: 1, perform: {
                    sendCommands(themeName: data.themes[index].rawValue)
                })
                .padding()
            }
        }
        
    }
    
    
    
    
    
    
    func sendCommands(themeName: String) {
        UserPreferences().savePreference(themeName)
        gameModel.refresh()
        isReady = true
    }
    
}



struct ThemeView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
    }
}


struct Theme: Identifiable {
    var id: Int = Int()
    var themes: [GameTheme] = [GameTheme]()
    
    private var counter = 0
    
    init() {
        for theme in GameTheme.allCases {
            themes.append(theme)
            id = counter
            counter += 1
        }
    }
    
}


