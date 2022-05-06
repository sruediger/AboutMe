//
//  MockedApp.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import Foundation
import XCTest

/// Class that mocks this app to perform UITests
public final class MockedApp {
    /// Instance of the mocked application
    internal lazy var instance: XCUIApplication = .init()
    
    // - MARK: TODO move all app strings to Localizable file and create models to turn them and other components accessible to the main and both tests targets
    
    internal lazy var mainScreenTexts: [String] = [String.localized("STXMainTitle"), "Sérgio Gomes Ruediger", String.localized("STXOccupation"), String.localized("STXLocation"), String.localized("BTNLanguages"), String.localized("BTNSkills"), String.localized("BTNApps"), String.localized("BTNExperiences"), String.localized("BTNCuriosities"), String.localized("BTNContact")]
    
    /// Helper method that fetch an NSLocalizedString. By default the XCTest framework doesn't enable string localization, that's why an auxiliary method is required besides the String+Utils localized method.
    /// - Parameter Identifier: Localized String identifier, defined at Localizable.strings
    /// - Class that called this method
    /// - Returns the localized String for the specific caller
    public func localizedString(_ identifier: String, _ caller: AnyClass) -> String {
        return NSLocalizedString(identifier, bundle: Bundle(for: caller), comment: "")
    }
    
    /// Assert that a button exists and tap it
    /// - Parameter button: XCUIElement object that represent this app's buttons
    internal func assertButtonExistsAndTap(button: XCUIElement) {
        XCTAssert(button.exists)
        button.tap()
    }
    
    /// Set the device orientation to portrait if not set
    internal func restartOrientation() {
        if XCUIDevice.shared.orientation != .portrait {
            XCUIDevice.shared.orientation = .portrait
        }
    }
    
    internal func toggleOrientation(of device: XCUIDevice) {
        switch device.orientation {
            case .portrait: device.orientation = .landscapeLeft
            case .portraitUpsideDown: device.orientation = .landscapeRight
            case .landscapeLeft: device.orientation = .portraitUpsideDown
            case .landscapeRight: device.orientation = .portrait
            default: device.orientation = .portrait
        }
    }
    
}
