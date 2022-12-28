//
//  ExperiencesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Experiences subview presented by the PopupView
internal struct ExperiencesView: ViewFactory, ExperiencesScreen {
    /// Object used to control the View
    @State private(set) var viewModel: ExperiencesViewModel
    
    init(viewModel: ExperiencesViewModel = .init()) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    @ViewBuilder
    /// Creates the main Content View with O(nˆ2) time complexity
    /// - Returns ExperiencesView ContentView
    func createContentView() -> some View {
        ForEach(self.rowsAmount, id: \.self) {
            let sectionTitle: String = viewModel.getSection(titleAt: $0)
            
            self.createRoundedTextView(sectionTitle, font: .title2, fontWeight: .semibold, foregroundColor: .secondary)
            
            self.createExperienceSectionItemsView(forRow: $0)
        }
        .padding(.leading, self.defaultPadding)
    }
}

