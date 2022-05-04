//
//  AnimatableScroll.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import Foundation

/// Protocol that identifies which types can be animated by a HorizontalCarouselView
internal protocol AnimatableScroll {
    /// Item description
    var description: String { get }
    /// Item's image path
    var imagePath: String { get }

    /// Collection of all items that will be presented
    static var allItems: [AnimatableScroll] { get }
}
