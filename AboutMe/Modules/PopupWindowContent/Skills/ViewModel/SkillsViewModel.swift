//
//  SkillsViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

/// Structure used to control the SkillsView
struct SkillsViewModel {
    /// Computed property that contains some Sérgio's soft skills
    internal var softSkills: [String] { [String.localized("SFTTeamWork"), String.localized("SFTCommunication"), String.localized("SFTProblemSolving"), String.localized("SFTOrganization"), String.localized("SFTCuriosity"), String.localized("SFTCreativity"), String.localized("SFTPerseverance"), String.localized("SFTResourcefulness")] }
    
    /// Fetch the title of a skills section
    /// - Parameter index: Index of the section
    /// - Returns String containing the section title
    internal func getSkillsTitle(of index: Int) -> String {
        switch index {
            case 0: return String.localized("SKSiOSDev")
            case 1: return String.localized("SKSTechSkills")
            case 2: return String.localized("SKSDatabases")
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
            case 0: return AppleDevelopmentSkill.allCases
            case 1: return DevelopmentSkill.allCases
            case 2: return DatabaseSkill.allCases
            case 3: return DesignSkill.allCases
            default: return []
        }
    }
}
