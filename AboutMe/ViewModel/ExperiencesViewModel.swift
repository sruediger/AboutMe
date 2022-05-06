//
//  ExperiencesViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Structure used to control the ExperiencesView
struct ExperiencesViewModel {
    /// Computed property that indicates if the device is an iPhone 8/SE2 or smaller (iPods)
    internal var smallPhone: Bool { UIScreen.main.bounds.height <= 667 }
    /// ExperienceItem title font
    internal var titleFont: Font.TextStyle { smallPhone ? .subheadline : .title3 }
    /// ExperienceItem content font
    internal var contentFont: Font { smallPhone ? .footnote : .subheadline }
    
    /// Fetch the ExperienceItem section title
    /// - Parameter index: Index of the title
    /// - Returns String containing the section title
    internal func getSection(titleAt index: Int) -> String {
        return index == 0 ? String.localized("EXSEducation") : String.localized("EXSProfessional")
    }
    
    /// Fetch the ExperienceItem section items
    /// - Parameter index: Index of the experiences (aka items)
    /// - Returns Array<ExperienceItem> containing the section items
    internal func getSection(itemsAt index: Int) -> [ExperienceItem] {
        return index == 0 ? ExperienceItem.getSergioEducation() : ExperienceItem.getSergioExperiences()
    }
    
    /// Fetch the ExperienceItem image path
    /// - Parameter index: Index of the item
    /// - Returns String containing the image path
    internal func getItem(imagePathAt index: Int) -> String {
        return index == 0 ? "graduationcap.fill" : "calendar.badge.clock"
    }
    
}
