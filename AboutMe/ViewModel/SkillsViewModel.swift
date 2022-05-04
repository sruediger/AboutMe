//
//  SkillsViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import Foundation

struct SkillsViewModel {
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
