//
//  ProgrammingLanguages.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

@frozen internal enum ProgrammingLanguages: String, Identifiable, CaseIterable, CustomStringConvertible, AnimatableScroll {
    case swift, objectiveC, c, cpp, shellScript, java, python, haskell, rust, solidity, javascript
    
    internal var id: String { self.rawValue.withFirstLetterCapitalized }
    
    internal var description: String {
        switch self {
            case .cpp: return "C++"
            case .objectiveC: return "Objective C"
            case .shellScript: return "Shell Script"
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    internal var imagePath: String { "Languages/\(self.rawValue.withFirstLetterCapitalized)" }
    
    internal static var allItems: [AnimatableScroll] {
        var items: [AnimatableScroll] = []

        Self.allCases.forEach { items.append($0) }
        
        return items
    }

}
