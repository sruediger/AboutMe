//
//  DesignSystem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 19/12/22.
//

import struct CoreGraphics.CGFloat

/// Protocol that defines common properties used to compose the app's design system
protocol DesignSystem: TextProperties {
    /// App's default spacing
    var defaultSpacing: CGFloat { get }
    /// App's half default spacing
    var halfDefaultSpacing: CGFloat { get }
    /// App's default padding
    var defaultPadding: CGFloat { get }
    /// App's half default padding
    var halfDefaultPadding: CGFloat { get }
    /// App's dafault corner radius
    var defaultCornerRadius: CGFloat { get }
}


/// DesignSystem+DefaultImplementations
extension DesignSystem {
    // Override for further customization
    // - MARK: Default values
    var defaultSpacing: CGFloat { 10 }
    var defaultPadding: CGFloat { 20 }
    var defaultCornerRadius: CGFloat { 20 }
    // - MARK: Half values
    var halfDefaultSpacing: CGFloat { defaultSpacing / 2 }
    var halfDefaultPadding: CGFloat { defaultPadding / 2 }
}
