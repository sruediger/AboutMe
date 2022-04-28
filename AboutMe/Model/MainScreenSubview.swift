//
//  MainScreenSubview.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

@frozen internal enum MainScreenSubview: String, Identifiable, CaseIterable {
    case skills, languages, technologies, apps, curiosities, contact
    
    internal var id: String { self.rawValue.withFirstLetterCapitalized }
    
    internal var imagePath: String {
        switch self {
            case .skills: return "wrench.and.screwdriver"
            case .languages: return "globe"
            case .technologies: return "cpu"
            case .apps: return "questionmark.app"
            case .curiosities: return "info.circle"
            case .contact: return "paperplane.circle"
        }
    }
}
