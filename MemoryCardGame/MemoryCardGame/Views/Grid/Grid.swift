//
//  Grid.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/13/21.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    
    var items: [Item]
    var itemView: (Item) -> ItemView
    
    init(items: [Item], itemView: @escaping (Item) -> ItemView) {
        self.items = items
        self.itemView = itemView
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach (items) { item in
            body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        
        let index = items.index(of: item)
        
        return itemView(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index!))
    }
}

