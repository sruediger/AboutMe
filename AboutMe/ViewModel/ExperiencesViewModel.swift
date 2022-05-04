//
//  ExperiencesViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

struct ExperiencesViewModel {
    
    internal var smallPhone: Bool { UIScreen.main.bounds.height <= 667 }

    internal var titleFont: Font.TextStyle { smallPhone ? .subheadline : .title3 }
    
    internal var contentFont: Font { smallPhone ? .footnote : .subheadline }
    
    
    internal func getSection(titleAt index: Int) -> String {
        return index == 0 ? "Education" : "Professional"
    }
    
    internal func getSection(itemsAt index: Int) -> [ExperienceItem] {
        return index == 0 ? ExperienceItem.getSergioEducation() : ExperienceItem.getSergioExperiences()
    }
    
    internal func getItem(imagePathAt index: Int) -> String {
        return index == 0 ? "graduationcap.fill" : "calendar.badge.clock"
    }
    
}
