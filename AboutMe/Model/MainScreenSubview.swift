//
//  MainScreenSubview.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

/// Enumeration that contains all Main Screen Subviews
@frozen internal enum MainScreenSubview: String, Identifiable, CaseIterable, CustomStringConvertible {
    case languages, skills, apps, experience, curiosities, contact
    
    /// Subview identifier
    internal var id: String {
        switch self {
            case .languages: return String.localized("BTNLanguages")
            case .skills: return String.localized("BTNSkills")
            case .apps: return String.localized("BTNApps")
            case .experience: return String.localized("BTNExperiences")
            case .curiosities: return String.localized("BTNCuriosities")
            case .contact: return String.localized("BTNContact")
        }
    }
    
    /// Subview description (title)
    internal var description: String { self.id }
    
    /// Path of the image
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
