//
//  Experience.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct CoreGraphics.CGSize

/// Protocol that defines sources of experience
protocol Experience: InteractiveItem, Hashable {
    /// Experience's short description
    var shortDescription: String { get }
    /// Experience's duration textual representation
    var duration: String { get }
    /// Experience's duration asset
    var durationAsset: Asset { get }
    /// Experience's duration asset default dimensions
    var durationIconDimensions: CGSize { get }
}

/// Experience+DefaultImplementations
internal extension Experience {
    var id: String { self.description }
    var durationIconDimensions: CGSize { .init(width: 18, height: 18) }
}
