//
//  MainScreenSubview+InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIColor
import struct SwiftUI.Color
import struct CoreGraphics.CGSize

internal extension MainScreenSubview {
    /// Subview identifier
    var id: String {
        switch self {
            case .languages: return .localized("BTNLanguages")
            case .skills: return String.localized("BTNSkills")
            case .apps: return String.localized("BTNApps")
            case .experience: return String.localized("BTNExperiences")
            case .achievements: return String.localized("BTNAchievements")
            case .contact: return String.localized("BTNContact")
        }
    }
    
    /// Subview description (title)
    var description: String { self.id }
    
    /// Subview's image
    var image: Asset {
        return Asset(
            path: self.imagePath,
            color: UIColor(.primary.opacity(0.9)),
            dimensions: CGSize(width: 48, height: 48),
            shadowRadius: 6
        )
    }
}

private extension MainScreenSubview {
    /// Path of the image
    var imagePath: String {
        switch self {
            case .experience: return "books.vertical"
            case .languages: return "globe"
            case .skills: return "wrench.and.screwdriver"
            case .apps: return "questionmark.app"
            case .achievements: return "trophy.circle"
            case .contact: return "paperplane.circle"
        }
    }
}
