//
//  ContactsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Contacts subview presented by the ModalView
struct ContactsView: View {
    /// AvailableContacts alias
    typealias Contact = AvailableContacts
    /// CompletionHandler alias
    typealias Callback = (Contact) -> Void
    /// Action that happens when an item (app) is tapped
    let completionHandler: Callback
    
    var body: some View {
        HStack(spacing: 32) {
            let contacts: [Contact] = [.linkedIn, .github, .telegram]
            ForEach(contacts, id: \.self) { contact in
                Button {
                    DispatchQueue.main.async { self.completionHandler(contact) }
                } label: {
                    VStack(alignment: .center, spacing: 5) {
                        ComponentCreator.create(imageFromPath: contact.imagePath, dimensions: CGSize(width: 46, height: 46))
                        
                        Text(contact.description)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

