//
//  ContactsScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct CoreGraphics.CGFloat

/// Protocol that defines the ContactsScreen model
protocol ContactsScreen: Screen, WebViewHandler {
    /// Default vertical spacing
    var verticalSpacing: CGFloat { get }
    /// Default horizontal spacing
    var horizontalSpacing: CGFloat { get }
    /// Collection of available contacts
    var availableContacts: [Contact] { get }
    /// Shorthand typealias for AvailableContacts
    associatedtype Contact where Contact == AvailableContacts
}

/// ContactsScreen+DefaultImplementations
internal extension ContactsScreen {
    var verticalSpacing: CGFloat { 5 }
    var horizontalSpacing: CGFloat { 32 }
    var availableContacts: [Contact] { [.linkedIn, .github, .telegram] }
}
