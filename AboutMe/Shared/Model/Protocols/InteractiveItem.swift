//
//  InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 17/12/22.
//

/// Protocol that defines a interactive item
protocol InteractiveItem: AnimatableScroll, Equatable, Identifiable, CaseIterable {
    /// Item's name
    var name: String { get }
    /// Item's raw payload to synthesize the interaction from a JSON
//    var interactionContent: String { get }
}

/// InteractiveItem+DefaultImplementations
internal extension InteractiveItem {
    var name: String { self.description }
//    var interactionContent: String { "" }
    var isInteractive: Bool { true }
}
