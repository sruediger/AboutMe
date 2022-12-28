//
//  SkillsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Skills subview presented by the PopupView
internal struct SkillsView: ViewFactory, SkillsScreen {
    /// Object used to control the View
    @State var viewModel: SkillsViewModel
    
    init(viewModel: SkillsViewModel = SkillsViewModel()) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    @ViewBuilder
    /// Creates the main Content View
    /// - Returns SkillsView ContentView
    func createContentView() -> some View {
        self.createSkillsRows()
    }
}
