//
//  UserDevice.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIDevice
import enum UIKit.UIUserInterfaceIdiom

/// Protocol that defines common user device's properties
protocol UserDevice {
    /// User's current device
    var currentDevice: CurrentDevice { get }
    /// UIUserInterfaceIdiom shorthand
    associatedtype CurrentDevice where CurrentDevice == UIUserInterfaceIdiom
}

/// UserDevice+DefaultImplementations
internal extension UserDevice {
    var currentDevice: CurrentDevice { UIDevice.current.userInterfaceIdiom }
}
