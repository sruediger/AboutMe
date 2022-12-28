//
//  AvailableContacts+InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

internal extension AvailableContacts {
    /// Contact identifier
    var id: Int { self.hashValue }
    
    /// Contact asset name
    var name: String {
        switch self {
            case .linkedIn: return "linkedIn"
            default: return self.rawValue
        }
    }
    
    /// Contact description (title)
    var description: String { self.name.withFirstLetterCapitalized }
    
    /// Contact's image
    var image: Asset {
        return Asset(
            path: "Contacts/\(name)",
            dimensions: .init(width: 46, height: 46)
        )
    }
}
