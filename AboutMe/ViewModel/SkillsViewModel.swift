//
//  SkillsViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import Foundation

/// Structure used to control the SkillsView
struct SkillsViewModel {
    /// Computed property that contains some Sérgio's soft skills
    internal var softSkills: [String] { ["Team work", "Communication", "Problem Solving", "Organization", "Curiosity", "Creativity", "Perseverance", "Resourcefulness"] }
    
    /// Fetch the title of a skills section
    /// - Parameter index: Index of the section
    /// - Returns String containing the section title
    internal func getSkillsTitle(of index: Int) -> String {
        switch index {
            case 0: return "iOS Development"
            case 1: return "Technical Skills"
            case 2: return "Databases"
            case 3: return "Design"
            case 4: return "Soft Skills"
            default: return ""
        }
    }
    
    /// Fetch the skills items for a given section
    /// - Parameter index: Index of the section
    /// - Returns Array<AnimatableScroll> containing the section items
    internal func getSkillsItems(of index: Int) -> [AnimatableScroll] {
        switch index {
            case 0: return TechSkills.iOSDevelopment
            case 1: return TechSkills.generalDevelopment
            case 2: return TechSkills.databases
            case 3: return TechSkills.design
            default: return []
        }
    }
}
