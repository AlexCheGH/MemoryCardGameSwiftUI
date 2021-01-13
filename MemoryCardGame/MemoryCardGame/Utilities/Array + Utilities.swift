//
//  Array + Utilities.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/13/21.
//

import Foundation

extension Array where Element: Identifiable {
    
    func index(of item: Element) -> Int? {
        for index in 0..<self.count {
            if item.id == self[index].id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
