//
//  MainScreenUITests.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import XCTest

extension MainScreenUITests {
    
    func testButtons() throws {
        guard let app = self.mockedApp else { return }

        app.instance.launch()
        MainScreenSubview.allCases.forEach {
            let button = app.instance.buttons[$0.description]
            XCTAssert(button.exists)
            XCTAssert(button.waitForExistence(timeout: 0.5))
        }
    }
    
    func testStaticTexts() throws {
        guard let app = self.mockedApp else { return }
        
        app.instance.launch()
        app.mainScreenTexts.forEach {
            let text = app.instance.staticTexts[$0]
            XCTAssert(text.exists)
        }
    }
    
}

final class MainScreenUITests: XCTestCase {
    private var mockedApp: MockedApp? = nil

    override func setUp() {
        NSLog("%@", "setUp")
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mockedApp = MockedApp()
    }
    
    override func tearDown()  {
        NSLog("%@", "tearDown§")
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.mockedApp = nil
    }
    
    override func setUpWithError() throws {
        NSLog("%@", "setUpWithError")
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        NSLog("%@", "tearDownWithError")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
