//
//  TechSkills.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import Foundation

/// Enumaration that contains all Sérgio's tech skills
@frozen internal enum TechSkills: String, Identifiable, CaseIterable, CustomStringConvertible, AnimatableScroll {
    case appStore, xcode, testflight, swiftUI, UIKit, coreData, git, jenkins, linux, SQLite, mySQL, postgresql, mongoDB, HTML, CSS, bootstrap, react, JSON, XML, figma, photoshop
        
    /// TechSkill identifier
    internal var id: String { self.description }
    
    /// TechSkill description (title)
    internal var description: String {
        switch self {
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    /// Path of the image
    internal var imagePath: String { "TechSkills/\(self.id)" }
    
    /// All iOS development skills learned by Sérgio
    internal static var iOSDevelopment: [AnimatableScroll] { [Self.appStore, Self.xcode, Self.testflight, Self.UIKit, Self.swiftUI, Self.coreData] }
    
    /// All general development skills learned by Sérgio
    internal static var generalDevelopment: [AnimatableScroll] { [Self.linux, Self.git, Self.JSON, Self.XML, Self.HTML, Self.CSS, Self.bootstrap, Self.react, Self.jenkins] }
    
    /// All databases learned by Sérgio
    internal static var databases: [AnimatableScroll] { [Self.SQLite, Self.mySQL, Self.postgresql, Self.mongoDB] }
    
    /// Al design tools learned by Sérgio
    internal static var design: [AnimatableScroll] { [Self.figma, Self.photoshop] }
    
    /// All cases of of this enum represented as an Array<AnimatableScroll>
    internal static var allItems: [AnimatableScroll] { Self.iOSDevelopment + Self.generalDevelopment + Self.databases + Self.design }

}
