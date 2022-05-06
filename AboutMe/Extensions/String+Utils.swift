//
//  String+Utils.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

extension String {
    
    /// Fetch a NSLocalizedString
    /// - Parameter name: Localized String identifier
    /// - Returns the specific localized string or empty if not exists
    public static func localized(_ name: String) -> String {
        return NSLocalizedString(name, comment: "")
    }
    
    /// Capitalizes the first character of a string
    /// - Returns String containing self with the first char uppercased
    private func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    /// Computed property that capitalizes the first character of this string
    internal var withFirstLetterCapitalized: String {
        let newString = self.capitalizingFirstLetter()
        return newString
    }
}
