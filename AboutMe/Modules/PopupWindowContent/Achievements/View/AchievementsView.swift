//
//  AchievementsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Achievements subview presented by the PopupView
internal struct AchievementsView: ViewFactory, AchievementsScreen {
    /// Orientation manager
    @Orientation var orientation
    /// Task that happens when an achievement is tapped
    let completionHandler: Callback
    
    init(completionHandler: @escaping Callback) {
        self.completionHandler = completionHandler
    }
    
    @ViewBuilder
    /// Creates the main ContentView
    /// - Returns AchievementsView ContentView
    func createContentView() -> some View {
        VStack(alignment: .leading, spacing: .zero) {
            self.createAchievementsRowsView()
                .padding(.top, self.halfDefaultPadding / 4)
        }
        .padding(.horizontal, self.alternatePadding)
    }
}
