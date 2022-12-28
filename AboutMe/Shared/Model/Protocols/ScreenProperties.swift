//
//  ScreenProperties.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIScreen
import struct CoreGraphics.CGSize

/// Protocol that defines common screen properties
protocol ScreenProperties: UserDevice {
    /// Indicates if the device is an iPhone 8/SE2 or smaller (iPods)
    var smallPhone: Bool { get }
    /// User's current device screen dimensions
    var screenDimensions: CGSize { get }
}

/// ScreenProperties+DefaultImplementations
internal extension ScreenProperties {
    var smallPhone: Bool { screenDimensions.height <= 667 }
    var screenDimensions: CGSize { .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) }
}
