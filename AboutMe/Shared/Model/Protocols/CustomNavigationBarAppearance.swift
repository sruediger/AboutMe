//
//  CustomNavigationBarAppearance.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UINavigationBarAppearance

/// Protocol that allows overriding system's default navigation bar appearance
protocol CustomNavigationBarAppearance {
    /// CustomNavigationBarAppearance's enclosing type
    associatedtype Appearance where Appearance == UINavigationBarAppearance
    
    /// CustomNavBarAppearance standard settings
    var defaultSettings: Appearance { mutating get }
}
