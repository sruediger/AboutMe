//
//  AppsScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct SwiftUI.Color
import struct CoreGraphics.CGFloat

/// Protocol that defines the AppScreen model
protocol AppsScreen: Screen, WebViewHandler {
    /// Categorized apps amount
    var rowsAmount: Range<Int> { get }
    /// Row's title foreground color
    var rowTitleForegroundColor: Color { get }
}

/// AppsScreen+DefaultImplementations
internal extension AppsScreen {
    // - MARK: Overrides
    var defaultSpacing: CGFloat { 0 }
    var defaultPadding: CGFloat { 15 }
    // - MARK: Default values
    var rowsAmount: Range<Int> { 0..<2 }
    var rowTitleForegroundColor: Color { .primary.opacity(0.6) }
}
