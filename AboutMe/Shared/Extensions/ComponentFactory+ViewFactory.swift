//
//  ComponentFactory+ViewFactory.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import protocol SwiftUI.View
import struct SwiftUI.ViewBuilder

internal extension ComponentFactory where Self: ViewFactory {

    @ViewBuilder
    /// Main method that creates the ComponentView
    /// - Returns ComponentView
    func createContentView() -> some View { self.create() }
}

/// Typealias that defines a ComponentCreator, which is also a Component & View Factory
typealias ComponentCreator = ComponentFactory & ViewFactory
