//
//  Cardify.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/20/21.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    var isFaceUp: Bool
    
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
    
    func body(content: Content) -> some View {
        
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
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
        return self.modifier(Cardify(isFaceUp: isFaceUp))
        
    }
}
