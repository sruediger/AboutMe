//
//  ProgrammingLanguages.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

@frozen internal enum ProgrammingLanguages: String, Identifiable, CaseIterable, CustomStringConvertible {
    case swift, objectiveC, c, cpp, shellScript, java, python, haskell, rust, solidity
    
    internal var id: String { self.rawValue.withFirstLetterCapitalized }
    
    internal var description: String {
        switch self {
            case .objectiveC: return "Objective C"
            case .shellScript: return "Shell Script"
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    internal var imagePath: String {
        switch self {
            case .swift: return "Languages/Swift"
            case .objectiveC: return "Languages/ObjectiveC"
            case .c: return "Languages/C"
            case .cpp: return "Languages/Cpp"
            case .shellScript: return "Languages/ShellScript"
            case .java: return "Languages/Java"
            case .python: return "Languages/Python"
            case .haskell: return "Languages/Haskell"
            case .rust: return "Languages/Rust"
            case .solidity: return "Languages/Solidity"
        }
    }
}
