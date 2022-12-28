//
//  ContactsView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

internal extension ContactsView {
    
    @ViewBuilder
    /// Creates Sérgio's ContactsRow
    /// - Returns ContactsRowView
    func createContactsRowView() -> some View {
        ForEach(self.availableContacts, id: \.self) {
            self.createContactButton(for: $0)
        }
    }
}

/// ContactsView+PrivateBuilders
private extension ContactsView {
    
    @ViewBuilder
    /// Creates a single ContactButton
    /// - Parameter contact: Button's data source
    /// - Returns ContactButtonView
    func createContactButton(for contact: Contact) -> some View {
        Button {
            DispatchQueue.main.async { self.completionHandler(contact) }
        } label: {
            VStack(alignment: .center, spacing: self.verticalSpacing) {
                ImageView(asset: contact.image)
                
                Text(contact.description)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
        }
    }
}
