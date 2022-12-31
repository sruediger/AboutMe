//
//  AppsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Apps subview presented by the PopupView
internal struct AppsView: ViewFactory, AppsScreen {
    /// Object used to control the View
    @State var viewModel: AppsViewModel
    
    init(viewModel: AppsViewModel = .init()) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    @ViewBuilder
    /// Creates the main Content View
    /// - Returns AppsView ContentView
    func createContentView() -> some View {
        ForEach(self.rowsAmount, id: \.hashValue) {
            let label: String = viewModel.getLabel(of: $0)
            self.createAppsRowView(named: label, at: $0)
        }
    }
}
