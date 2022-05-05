//
//  AvailableContacts.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import Foundation

/// Enumaration that contains all Sérgio's contacts
@frozen internal enum AvailableContacts: Int, WebViewRepresentable, Identifiable, CaseIterable, CustomStringConvertible {
    case linkedIn, github, telegram
    
    /// Contact identifier
    internal var id: Int { self.rawValue }
    
    /// Contact asset name
    private var name: String {
        switch self {
            case .linkedIn: return "linkedIn"
            case .github: return "github"
            case .telegram: return "telegram"
        }
    }
    
    /// Contact description (title)
    internal var description: String { self.name.withFirstLetterCapitalized }
    
    /// Path of the image
    internal var imagePath: String { "Contacts/\(name)" }
    
    /// Contact page URL
    internal var url: URL {
        switch self {
            case .linkedIn: return URL(string: "https://linkedin.com/in/sergiogruediger")!
            case .github: return URL(string: "https://github.com/sruediger")!
            case .telegram: return URL(string: "https://t.me/sgruediger")!
        }
    }
}
