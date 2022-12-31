//
//  ComponentProvider.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 17/12/22.
//

/// Protocol that provides components and common properties which may be useful to parent views
protocol ComponentProvider {
    /// Property that indicates if the component is interactive
    var isInteractive: Bool { get }
}

/// ComponentProvider+DefaultImplementations
internal extension ComponentProvider {
    var isInteractive: Bool { false }
}
