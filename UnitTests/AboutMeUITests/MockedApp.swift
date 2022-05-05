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
    
    internal lazy var mainScreenTexts: [String] = ["About Me", "Sérgio Gomes Ruediger", "iOS developer & software engineer", "Brasília, Brazil", "Languages", "Skills", "Apps", "Experience", "Curiosities", "Contact"]

    
    
}
