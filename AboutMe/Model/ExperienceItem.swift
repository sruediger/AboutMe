//
//  ExperienceItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 01/05/22.
//

import Foundation

/// Experience Item presented by the ExperiencesView that represents educational or professional experiences
struct ExperienceItem: Identifiable {
    /// Name of the experience
    internal let name: String
    
    /// A short description that will appear below the name
    internal let shortDescription: String
    
    /// Duration of the experience
    internal let duration: String

    /// Path of the image
    internal let imagePath: String
    
    /// Experience identifier
    internal var id: String { UUID().uuidString }
}

extension ExperienceItem {
    
    /** Getter that returns all Sérgio's educational experiences
        - Returns Array<ExperienceItem>*/
    public static func getSergioEducation() -> [ExperienceItem] {
        let educations: [ExperienceItem] = [ExperienceItem(name: String.localized("EITUCB"), shortDescription: String.localized("EIDComputerScience"), duration: "2019 - 2022", imagePath: "building.columns"), ExperienceItem(name: "Apple Developer Academy", shortDescription:String.localized("EIDDeveloperAcademy"), duration: "2021 - 2022", imagePath: "command")]
        
        return educations
    }
    
    /** Getter that returns all Sérgio's professional experiences
        - Returns Array<ExperienceItem>*/
    public static func getSergioExperiences() -> [ExperienceItem] {
        let experiences: [ExperienceItem] = [ExperienceItem(name: String.localized("EITFreela"), shortDescription: String.localized("EIDFreela"), duration: "2020 - \(String.localized("EIDFreelaTime"))", imagePath: "laptopcomputer.and.iphone")]
        
        return experiences
    }
    
}
