//
//  Application+InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

internal extension Application {
    /// App's instance identifier
    var id: String {
        switch self {
            case .iHasher: return self.rawValue
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    /// App description (title)
    var description: String {
        switch self {
            case .faunaVsBunny: return "Fauna Vs Bunny"
            case .catchNap: return "Catch Nap"
            case .iHasher, .fonospace, .pluty, .noty: return self.id
            case .secretly: return "Secret.ly"
        }
    }
    
    /// App's image
    var image: Asset { .init(path: "Apps/\(self.id)") }
}
