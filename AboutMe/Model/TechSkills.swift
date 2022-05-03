//
//  TechSkills.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import Foundation

@frozen internal enum TechSkills: String, Identifiable, CaseIterable, CustomStringConvertible, AnimatableScroll {
    case appStore, xcode, testflight, git, jenkins, figma, photoshop
    
    internal var id: String { self.description }
    
    internal var description: String {
        switch self {
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    internal var imagePath: String { "TechSkills/\(self.id)" }
    
    internal static var allItems: [AnimatableScroll] {
        var items: [AnimatableScroll] = []

        Self.allCases.forEach { items.append($0) }
        
        return items
    }

}
