//
//  TechSkill+InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

internal extension TechSkill {
    /// TechSkill identifier
    var id: String { self.description }
    /// Interactivity status
    var isInteractive: Bool { false }
    /// TechSkill's image
    var image: Asset { .init(path: "TechSkills/\(self.id)") }
}
