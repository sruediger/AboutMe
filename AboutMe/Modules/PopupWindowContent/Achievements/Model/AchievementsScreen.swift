//
//  AchievementsScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct CoreGraphics.CGFloat

/// Protocol that defines the AchievementsScreen model
protocol AchievementsScreen: Screen, WebViewHandler {
    /// Collection of all current achievements
    var achievements: [Achievement] { get }
    /// Alternate horizontal padding used at the main VStack
    var alternatePadding: CGFloat { get }
    /// Achievement's background opacity
    var achievementBackgroundOpacity: CGFloat { get }
    /// Achievement's texts minimum scale factor
    var achievementTextMinimumScaleFactor: CGFloat { get }
    /// Achievement's background shadow radius
    var achievementBackgroundShadowRadius: CGFloat { get }
    /// Achievement's background height scale factor
    var achievementBackgroundHeightScaleFactor: CGFloat { get }
}

/// AchievementsScreen+DefaultImplementations
internal extension AchievementsScreen {
    // - MARK: Padding
    var defaultPadding: CGFloat { 10 }
    var alternatePadding: CGFloat { 15 }
    // - MARK: Achievement
    var achievements: [Achievement] { Achievement.allCases }
    // - MARK: Achievement Properties
    var achievementBackgroundOpacity: CGFloat { 0.16 }
    var achievementBackgroundShadowRadius: CGFloat { 1 }
    var achievementTextMinimumScaleFactor: CGFloat { 0.64 }
}
