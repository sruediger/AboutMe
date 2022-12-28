//
//  SkillsScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct CoreGraphics.CGFloat

/// Protocol that defines the SkillsScreen model
protocol SkillsScreen: Screen {
    /// Categorized skills amount
    var rowsAmount: Range<Int> { get }
    /// Text views leading padding
    var textLeadingPadding: CGFloat { get }
    /// Index of the last HorizontalCarouselView parent view
    var lastComposedItemIndex: Int { get }
}

/// SkillsScreen+DefaultImplementations
internal extension SkillsScreen {
    var rowsAmount: Range<Int> { 0..<5 }
    var textLeadingPadding: CGFloat { 15 }
    var lastComposedItemIndex: Int { 3 }
}
