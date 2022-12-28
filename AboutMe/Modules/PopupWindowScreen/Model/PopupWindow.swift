//
//  PopupWindow.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIColor
import struct SwiftUI.Color
import struct CoreGraphics.CGFloat

/// Protocol that defines a PopupWindow
protocol PopupWindow: Screen {
    /// Close button image's asset
    var closeButton: Asset { get }
    /// Opacity of the background
    var backgroundOpacity: CGFloat { get }
    /// Default close button padding
    var closeButtonPadding: CGFloat { get }
    /// Background's default shadow radius
    var backgroundShadowRadius: CGFloat { get }
    /// Background's default foreground color
    var backgroundForegroundColor: Color { get }
    /// Default window header bottom padding
    var windowHeaderBottomPadding: CGFloat { get }
    /// Default window content bottom padding
    var windowContentBottomPadding: CGFloat { get }
}

/// PopupWindow+DefaultImplementations
internal extension PopupWindow {
    // - MARK: Overrides
    var defaultPadding: CGFloat { 18 }
    var defaultCornerRadius: CGFloat { 28 }
    // - MARK: Background
    var backgroundOpacity: CGFloat { 0.45 }
    var backgroundShadowRadius: CGFloat { 4 }
    var backgroundForegroundColor: Color { .accentColor.opacity(0.02) }
    // - MARK: Close Button
    var closeButton: Asset {
        return Asset(
            path: "x.circle.fill",
            color: UIColor(.secondary),
            dimensions: .init(width: 25, height: 25)
        )
    }
    var closeButtonPadding: CGFloat { 5 }
    // - MARK: Window padding
    var windowHeaderBottomPadding: CGFloat { 1 }
    var windowContentBottomPadding: CGFloat { 15 }
}
