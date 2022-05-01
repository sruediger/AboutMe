//
//  Applications.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import Foundation

@frozen internal enum Applications: String, Identifiable, CaseIterable, CustomStringConvertible, AnimatableScroll, WebViewRepresentable {
    
    case faunaVsBunny, catchNap, fonospace, iHasher, secretly
    
    internal var id: String {
        switch self {
            case .iHasher: return self.rawValue
            default: return self.rawValue.withFirstLetterCapitalized
        }
    }
    
    internal var description: String {
        switch self {
            case .faunaVsBunny: return "Fauna Vs Bunny"
            case .catchNap: return "Catch Nap"
            case .fonospace: return self.rawValue.withFirstLetterCapitalized
            case .iHasher: return self.rawValue
            case .secretly: return "Secret.ly"
        }
    }
    
    internal var imagePath: String { "Apps/\(self.id)" }
    
    internal var url: URL {
        let appStoreURL: String = "itms-apps://itunes.apple.com/us/app/apple-store"
        let appURL: URL
        
        switch self {
            case .faunaVsBunny: appURL = URL(string: appStoreURL.appending("/id1578548717"))!
            case .catchNap: appURL = URL(string: appStoreURL.appending("/id1592372877"))!
            case .fonospace: appURL = URL(string: appStoreURL.appending("/id1609281831"))!
            case .iHasher: appURL = URL(string: appStoreURL.appending("/id1586542328"))!
            case .secretly: appURL = URL(string: appStoreURL.appending("/id1606237250"))!
        }
        
        return appURL
    }
    
    internal static var allItems: [AnimatableScroll] {
        var items: [AnimatableScroll] = []

        Self.allCases.forEach { items.append($0) }
        
        return items
    }
    
}

extension Applications {
    
    
    internal static var authorial: [AnimatableScroll] {
        var items: [AnimatableScroll] = []

        items.append(Applications.secretly)
        items.append(Applications.iHasher)
        
        return items
    }
    
    internal static var collabs: [AnimatableScroll] {
        var items: [AnimatableScroll] = []
        
        Self.allCases.reversed().forEach {
            if $0 != .secretly && $0 != .iHasher {
                items.append($0)
            }
        }
        
        return items
    }
}
