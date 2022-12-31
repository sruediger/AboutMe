//
//  MainScreenSubview+TestUtils.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

extension MainScreenSubview {
    
    var identifier: String {
        switch self {
            case .languages: return "BTNLanguages"
            case .apps: return"BTNApps"
            case .achievements: return "BTNAchievements"
            case .contact: return "BTNContact"
            default: return ""
        }
    }
    
    var allItems: [any InteractiveItem]? {
        switch self {
            case .languages: return ProgrammingLanguage.allCases
            case .apps: return Application.allCases
            case .achievements: return Achievement.allCases
            case .contact: return AvailableContacts.allCases
            default: break
        }
        return nil
    }
}
