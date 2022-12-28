//
//  MainScreenView+MainScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

extension MainScreenView: MainScreen {
    /// Subview button's background color
    var itemBackgroundColor: Color { .secondary.opacity(colorScheme == .dark ? 0.15 : 0.55) }
    
    @ViewBuilder
    /// Creates a scrollable card view
    /// - Returns ScrollableCardView
    internal func createScrollableCardView() -> some View {
        let horizontalPadding = viewModel.horizontalCardViewPadding
        ScrollView(.vertical) {
            self.createCardItemsView()
                .padding(.bottom, self.defaultPadding)
                .padding(.top, self.halfDefaultPadding)
                .padding(.horizontal, horizontalPadding)
        }
    }
}
