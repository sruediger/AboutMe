//
//  ComponentFactory.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 08/12/22.
//

import protocol SwiftUI.View
import struct SwiftUI.ViewBuilder

/// Protocol that defines a Component Creator/Builder
protocol ComponentFactory: ComponentProvider {
    /// The component itself
    associatedtype ComponentView: View
    
    @ViewBuilder
    /// Main method that creates the ComponentView
    /// - Returns ComponentView
    func create() -> ComponentView
}
