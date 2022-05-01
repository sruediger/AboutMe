//
//  AnimatableScroll.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import Foundation

///
internal protocol AnimatableScroll {
    var description: String { get }
    var imagePath: String { get }

    static var allItems: [AnimatableScroll] { get }
}
