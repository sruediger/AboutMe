//
//  MainScreenUITests.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import XCTest

extension MainScreenUITests {
    
    func testAutolayout() throws {
        guard let app = self.mockedApp else { return }
        for _ in 0..<12 {
            app.toggleOrientation(of: XCUIDevice.shared)
        }
        XCTAssertNotNil(self.mockedApp)
    }
    
    func testButtons() throws {
        MainScreenSubview.allCases.forEach {
            guard let app = self.mockedApp else { return }

            let button = app.instance.buttons[$0.description]
            XCTAssert(button.exists)
            XCTAssert(button.waitForExistence(timeout: 0.5))
        }
    }
    
    func testStaticTexts() throws {
        guard let app = self.mockedApp else { return }
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
        self.mockedApp?.instance.launch()
        self.mockedApp?.restartOrientation()
    }
    
    override func tearDown()  {
        NSLog("%@", "tearDown")
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
}
