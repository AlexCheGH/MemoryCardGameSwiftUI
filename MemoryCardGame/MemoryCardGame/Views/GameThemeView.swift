//
//  GameThemeView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/14/21.
//

import SwiftUI

struct GameThemeView: View {
    
    @ObservedObject var gameModel = EmojiMemoryGame()
    
    @State var isReady = false
    let data = Theme()
    
    var body: some View {
            VStack {
                makeTexts()
            }
            .navigate(to: GameView(viewModel: gameModel), when: $isReady)
        //TODO:- fix landscape mode
        }
    
    func makeTexts() -> some View {
        let cornerRadius: CGFloat = 10
        let lineWidth: CGFloat = 3
        
       return VStack{
            ForEach (0..<data.themes.count, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.black, lineWidth: lineWidth)
                    RoundedRectangle(cornerRadius: cornerRadius)
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
        GameThemeManager().savePreference(themeName)
        gameModel.refresh()
        isReady = true
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


