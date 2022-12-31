//
//  TechSkill+StringProtocolRawRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

internal extension TechSkill where Self: RawRepresentable, Self.RawValue == String {
    /// TechSkill's description
    var description: String { self.rawValue.withFirstLetterCapitalized } // Indirectly inherited by CustomStringConvertible via InteractiveItem's AnimatableScroll conformance
}
