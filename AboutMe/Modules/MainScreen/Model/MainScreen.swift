//
//  MainScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIColor
import struct SwiftUI.Color
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat

/// Protocol that defines the app's Main Screen model
protocol MainScreen: Screen {
    /// The maximum height for a subview items row
    var maxRowHeight: CGFloat { get }
    /// Amount of subview items rows
    var rowsAmount: Range<Int> { get }
    /// Sérgio's memoji asset
    var memojiAsset: Asset { get }
    /// Sérgio's location asset
    var locationAsset: Asset { get }
    /// Background's color
    var backgroundColor: Color { get }
    /// Opacity of the background
    var backgroundOpacity: BackgroundOpacity { get }
    /// Subview's item foreground opacity
    var subviewItemForegroundOpacity: CGFloat { get }
    /// Tuple<CGFloat, CGFloat> typealias that represents the main card and item background opacity
    associatedtype BackgroundOpacity where BackgroundOpacity == (mainCard: CGFloat, item: CGFloat)
}

/// MainScreen+DefaultImplementations
internal extension MainScreen {
    // - MARK: Rows
    var maxRowHeight: CGFloat { 120 }
    var rowsAmount: Range<Int> { 0..<3 }
    // - MARK: Assets
    var memojiAsset: Asset {
        return Asset(
            path: "Sergio/memojiWWDC21",
            dimensions: CGSize(width: 90, height: 90)
        )
    }
    var locationAsset: Asset {
        return Asset(
            path: "location.fill",
            color: UIColor(.accentColor),
            dimensions: CGSize(width: 20, height: 20)
        )
    }
    var subviewItemForegroundOpacity: CGFloat { 0.9 }
    // - MARK: Background
    var backgroundColor: Color { .accentColor.opacity(0.025) }
    var backgroundOpacity: BackgroundOpacity { (0.08, 0.45) }
}
