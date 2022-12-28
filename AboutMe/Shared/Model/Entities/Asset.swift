//
//  Asset.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 17/12/22.
//

import class UIKit.UIImage
import class UIKit.UIColor
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat

/// Structure that defines an asset
internal struct Asset {
    /// Asset's path
    let path: String
    /// Asset's color
    let color: UIColor
    /// Asset's opacity
    let opacity: CGFloat
    /// Asset's dimensions
    let dimensions: CGSize
    /// Asset's scale ratio
    let scaleRatio: CGFloat
    /// Asset's shadowRadius
    let shadowRadius: CGFloat
    
    /// Computed property that checks if the image is a system default
    var systemDefault: Bool { UIImage(systemName: path) != nil }
    
    init(path: String, color: UIColor = .clear, opacity: CGFloat = .zero, dimensions: CGSize = .zero, scaleRatio: CGFloat = .zero, shadowRadius: CGFloat = .zero) {
        self.path = path
        self.color = color
        self.opacity = opacity
        self.dimensions = dimensions
        self.scaleRatio = scaleRatio
        self.shadowRadius = shadowRadius
    }
}
