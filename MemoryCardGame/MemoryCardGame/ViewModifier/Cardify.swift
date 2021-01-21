//
//  Cardify.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/21/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.orange)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.orange)
            }
        }
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
