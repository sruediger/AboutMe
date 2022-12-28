//
//  ViewFactory.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 17/12/22.
//

import protocol SwiftUI.View
import struct SwiftUI.ViewBuilder

/// Protocol that defines a View Creator/Builder
protocol ViewFactory: View {
    /// The view itself
    associatedtype Content: View
    
    @ViewBuilder
    /// Main method that creates the view's content
    /// - Returns ContentView
    func createContentView() -> Content
}

/// ViewFactory+DefaultImplementations
extension ViewFactory {
    // Override for further customization
    var body: some View { self.createContentView() }
}
