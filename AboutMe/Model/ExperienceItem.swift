//
//  ExperienceItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 01/05/22.
//

import Foundation

struct ExperienceItem: Identifiable {
    internal let name: String
    internal let shortDescription: String
    internal let duration: String
    internal let imagePath: String
    
    internal var id: String { UUID().uuidString }
}

extension ExperienceItem {
    
    public static func getSergioEducation() -> [ExperienceItem] {
        let educations: [ExperienceItem] = [ExperienceItem(name: "Catholic University of Brasilia", shortDescription: "Bachelor in Computer Science", duration: "2019 - 2022", imagePath: "building.columns"), ExperienceItem(name: "Apple Developer Academy", shortDescription: "iOS development capacitation", duration: "2021 - 2022", imagePath: "character.book.closed")]
        
        return educations
    }
    
    public static func getSergioExperiences() -> [ExperienceItem] {
        let experiences: [ExperienceItem] = [ExperienceItem(name: "Freelance Developer", shortDescription: "Problem solver through apps", duration: "2020 - nowadays", imagePath: "laptopcomputer.and.iphone")]
        
        return experiences
    }
    
}
