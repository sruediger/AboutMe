//
//  String+Utils.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import Foundation

extension String {
    private func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    internal var withFirstLetterCapitalized: String {
        let newString = self.capitalizingFirstLetter()
        return newString
    }
}
