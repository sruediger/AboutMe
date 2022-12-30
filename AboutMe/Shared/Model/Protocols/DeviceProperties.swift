//
//  DeviceProperties.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIDevice
import enum UIKit.UIUserInterfaceIdiom

/// Protocol that defines common user device's properties
protocol DeviceProperties {
    /// User's current device
    var currentDevice: CurrentDevice { get }
    /// UIUserInterfaceIdiom shorthand
    associatedtype CurrentDevice where CurrentDevice == UIUserInterfaceIdiom
}

/// DeviceProperties+DefaultImplementations
internal extension DeviceProperties {
    var currentDevice: CurrentDevice { UIDevice.current.userInterfaceIdiom }
}
