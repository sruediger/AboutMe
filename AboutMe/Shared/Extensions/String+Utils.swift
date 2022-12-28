//
//  String+Utils.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

extension String {
    
    /// Fetch a NSLocalizedString
    /// - Parameters
    ///     - Parameter name: Localized String identifier (aka LocalizedStringKey)
    ///     - Parameter arguments: LocalizedStringKey arguments
    /// - Returns the specific localized string or empty if not exists
    public static func localized(_ name: String, arguments: CVarArg...) -> String {
        return .localizedStringWithFormat(NSLocalizedString(name, comment: ""), arguments)
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
