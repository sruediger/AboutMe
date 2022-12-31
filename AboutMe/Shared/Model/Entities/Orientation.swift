//
//  Orientation.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct SwiftUI.StateObject
import enum UIKit.UIDeviceOrientation
import protocol SwiftUI.DynamicProperty

/// Property wrapper that safely manages the user device orientation
@propertyWrapper
struct Orientation: DynamicProperty {
    /// OrientationManager shared instance
    @StateObject private var manager = OrientationManager.shared
    
    /// PropertyWrapper's projected value
    public var wrappedValue: UIDeviceOrientation { manager.type }
}
