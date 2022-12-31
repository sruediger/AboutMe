//
//  ProgrammingLanguage+InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

internal extension ProgrammingLanguage {

    /// Object's instance identifier
    var id: String { self.rawValue.withFirstLetterCapitalized }
    
    /// Language description (title/name)
    var description: String {
        switch self {
            case .cpp: return "C++"
            case .objectiveC: return "Objective C"
            case .shellScript: return "Shell Script"
            default: return self.id
        }
    }
    
    /// ProgrammingLanguage's image
    var image: Asset { .init(path: "Languages/\(self.id)") }
}
