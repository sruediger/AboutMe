//
//  MainScreenSubview.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

@frozen internal enum MainScreenSubview: String, Identifiable, CaseIterable, CustomStringConvertible {
    case skills, languages, experience, apps, curiosities, contact
    
    internal var id: String { self.rawValue.withFirstLetterCapitalized }
    
    internal var description: String { self.id }
    
    internal var imagePath: String {
        switch self {
            case .experience: return "books.vertical"
            case .languages: return "globe"
            case .skills: return "wrench.and.screwdriver"
            case .apps: return "questionmark.app"
            case .curiosities: return "info.circle"
            case .contact: return "paperplane.circle"
        }
    }
}
