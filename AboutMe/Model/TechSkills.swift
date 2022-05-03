//
//  TechSkills.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import Foundation

@frozen internal enum TechSkills: String, Identifiable, CaseIterable, CustomStringConvertible, AnimatableScroll {
    case appStore, xcode, testflight, swiftUI, UIKit, coreData, git, jenkins, linux, SQLite, mySQL, postgresql, mongoDB, figma, photoshop
        
    internal var id: String { self.description }
    
    internal var description: String {
        switch self {
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    internal var imagePath: String { "TechSkills/\(self.id)" }
    
    internal static var iOSDevelopment: [AnimatableScroll] { [Self.appStore, Self.xcode, Self.testflight, Self.UIKit, Self.swiftUI, Self.coreData] }
    
    internal static var generalDevelopment: [AnimatableScroll] { [Self.linux, Self.git, Self.jenkins] }
    
    internal static var databases: [AnimatableScroll] { [Self.SQLite, Self.mySQL, Self.postgresql, Self.mongoDB] }
    
    internal static var design: [AnimatableScroll] { [Self.figma, Self.photoshop] }
    
    internal static var allItems: [AnimatableScroll] { Self.iOSDevelopment + Self.generalDevelopment + Self.databases + Self.design }

}
