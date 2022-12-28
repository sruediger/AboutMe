//
//  Applications.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

/// Enumaration that contains all apps developed by Sérgio
internal enum Application: String, InteractiveItem {
    case faunaVsBunny, catchNap, fonospace, iHasher, secretly, pluty, noty
    
    /// All apps made entirely by Sérgio
    internal static var authorial: [AnimatableScroll] {
        var items: [AnimatableScroll] = []

        items.append(Application.secretly)
        items.append(Application.iHasher)
        
        return items
    }
    
    /// All apps that Sérgio collaborated with
    internal static var collabs: [AnimatableScroll] {
        var items: [AnimatableScroll] = []
        
        Self.allCases.reversed().forEach {
            guard $0 != .secretly, $0 != .iHasher else { return }
            items.append($0)
        }
        return items
    }
}
