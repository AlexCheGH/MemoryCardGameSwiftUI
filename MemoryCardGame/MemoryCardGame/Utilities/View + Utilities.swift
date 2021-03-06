//
//  View + Utilities.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/16/21.
//

import SwiftUI

extension View {
    
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(
                    destination: view
                        .navigationBarItems(leading:
                                                Text("")
                                                .foregroundColor(.blue)
                        )
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}
