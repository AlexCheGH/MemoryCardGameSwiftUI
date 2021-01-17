//
//  UpperGameView.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/17/21.
//

import SwiftUI

struct UpperGameView: View {
    
    @Binding var score: Int
    @Binding var themeName: String?
    
    var action: () -> ()
    
    var body: some View {
        
        HStack {
            ScoreView(score: $score)
                .padding()
            ThemeNameView(themeName: $themeName)
                .padding()
            NewGameView(buttonText: "New Game") {
                action()
            }
            .padding()
        }
    }
}


struct ScoreView: View {
    @Binding var score: Int
    
    var body: some View {
        Text("Score: \(score)")
    }
}

struct ThemeNameView: View {
    @Binding var themeName: String?
    
    var body: some View {
        Text("Theme: \n" + (themeName ?? ""))
    }
}

struct NewGameView : View {
    var buttonText: String
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill()
                .foregroundColor(.white)
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .foregroundColor(.orange)
            Text(buttonText)
        }
        .onTapGesture {
            buttonAction()
        }
        
    }
}
