//
//  TextProperties.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct SwiftUI.Font

/// Protocol that defines common SwiftUI text properties
protocol TextProperties {
    /// Text's font style
    associatedtype FontStyle where FontStyle == Font.TextStyle
    /// Returns the default content title font
    var titleFont: FontStyle { get }
    /// Returns the default body content font
    var contentFont: FontStyle { get }
}
