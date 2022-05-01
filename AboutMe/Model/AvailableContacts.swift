//
//  AvailableContacts.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import Foundation

@frozen internal enum AvailableContacts: Int, WebViewRepresentable, Identifiable, CaseIterable, CustomStringConvertible {
    
    case linkedIn, github, telegram
    
    internal var id: Int { self.rawValue }
    
    private var name: String {
        switch self {
            case .linkedIn: return "linkedIn"
            case .github: return "github"
            case .telegram: return "telegram"
        }
    }
    
    internal var description: String { self.name.withFirstLetterCapitalized }
    
    internal var imagePath: String { "Contacts/\(name)" }
    
    internal var url: URL {
        switch self {
            case .linkedIn: return URL(string: "https://linkedin.com")!
            case .github: return URL(string: "https://github.com")!
            case .telegram: return URL(string: "https://telegram.org")!
        }
    }
}
