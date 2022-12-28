//
//  ExperiencesScreen.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct CoreGraphics.CGFloat

/// Protocol that defines the ExperiencesScreen model
protocol ExperiencesScreen: Screen {
    /// Amount of categorized experience items rows
    var rowsAmount: Range<Int> { get }
    /// Edges padding values
    var paddingEdge: PaddingEdges { get }
    /// Default experience details spacing for both axis (vertical & horizontal)
    var experienceDetailsSpacing: CGFloat { get }
    /// Tuple<CGFloat, CGFloat> that represents the remaining padding edges
    associatedtype PaddingEdges where PaddingEdges == (all: CGFloat, top: CGFloat)
}

/// Experiences+DefaultImplementations
internal extension ExperiencesScreen {
    // - MARK: Overrides
    var defaultPadding: CGFloat { 15 }
    // - MARK: ExperiencesScreen properties
    var rowsAmount: Range<Int> { 0..<2 }
    var paddingEdge: PaddingEdges { (2, 2.5) }
    var experienceDetailsSpacing: CGFloat { self.smallPhone ? 2 : 1.25 }
}
