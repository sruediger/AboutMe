//
//  ExperiencesViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Structure used to control the ExperiencesView
struct ExperiencesViewModel {

    /// Fetch the ExperienceItem section title
    /// - Parameter index: Index of the title
    /// - Returns String containing the section title
    internal func getSection(titleAt index: Int) -> String {
        return index == 0 ? String.localized("EXSEducation") : String.localized("EXSProfessional")
    }
    
    /// Fetch the ExperienceItem section items
    /// - Parameter index: Index of the experiences (aka items)
    /// - Returns Array<ExperienceItem> containing the section items
    internal func getSection(itemsAt index: Int) -> [any Experience] {
        return index == 0 ? AcademicBackground.allCases : ProfessionalExperience.allCases
    }
}
