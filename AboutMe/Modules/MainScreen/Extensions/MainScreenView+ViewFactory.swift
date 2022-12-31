//
//  MainScreenView+ViewFactory.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

extension MainScreenView: ViewFactory {
    
    @ViewBuilder
    /// Creates the main content view
    /// - Returns ContentView
    internal func createContentView() -> some View {
        NavigationView {
            self.createScrollableCardView()
                .navigationTitle(Text(String.localized("STXMainTitle")))
                .navigationBarTitleDisplayMode(.automatic)
                .background {
                    Color("Colors/background")
                        .ignoresSafeArea()
                }
        }
    }
}
