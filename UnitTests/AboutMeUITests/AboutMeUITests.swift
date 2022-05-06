//
//  AboutMeUITests.swift
//  AboutMeUITests
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import XCTest

/// Base class inherited by the other UITest cases that contains the default methods implementation
open class AboutMeUITests: XCTestCase {
    internal var mockedApp: MockedApp? = nil

    override open func setUp() {
        NSLog("%@", "setUp")
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mockedApp = MockedApp()
        self.mockedApp?.instance.launch()
        self.mockedApp?.restartOrientation()
    }
    
    override open func tearDown()  {
        NSLog("%@", "tearDown")
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.mockedApp = nil
    }
    
    override open func setUpWithError() throws {
        NSLog("%@", "setUpWithError")
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override open func tearDownWithError() throws {
        NSLog("%@", "tearDownWithError")
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
