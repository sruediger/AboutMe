//
//  AnimatableScroll.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

/// Protocol that identifies which types can be animated by a HorizontalCarouselView
protocol AnimatableScroll: ComponentProvider, CustomStringConvertible {
    /// Item's image path
    var image: Asset { get }
}
