//
//  ContactsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Contacts subview presented by the PopupView
internal struct ContactsView: ViewFactory, ContactsScreen {

    @ViewBuilder
    /// Creates the main Content View
    /// - Returns ContactsView ContentView
    func createContentView() -> some View {
        HStack(spacing: self.horizontalSpacing) {
            self.createContactsRowView()
        }
    }
}
