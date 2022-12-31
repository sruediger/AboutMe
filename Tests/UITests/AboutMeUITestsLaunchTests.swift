//
//  AboutMeUITestsLaunchTests.swift
//  AboutMeUITests
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import XCTest

class AboutMeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool { false }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
    }
    
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch the application.
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            let options: XCTMeasureOptions = .init()
            options.iterationCount = 1
            measure(metrics: [XCTApplicationLaunchMetric()], options: options) {
                XCUIApplication().launch()
            }
        }
    }
}
