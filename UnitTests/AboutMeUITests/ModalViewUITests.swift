//
//  ModalViewUITests.swift
//  AboutMeUITests
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import XCTest

extension ModalViewUITests {
    
    func testScrollLanguages() throws {
        guard let app = self.mockedApp else { return }
        
        app.instance.launch()
        
        let languagesSubviewButton = app.instance.buttons["Languages"]
        
        app.assertButtonExistsAndTap(button: languagesSubviewButton)
        
        for index in 0..<3 {
            let scrollVelocity: XCUIGestureVelocity = index >= 2 ? .slow : .fast
            app.instance.swipeLeft(velocity: scrollVelocity)
            app.instance.swipeRight(velocity: scrollVelocity)
        }
        
        XCTAssertNotNil(self.mockedApp)
    }
    
    func testScrollSkills() throws {
        guard let app = self.mockedApp else { return }
        
        app.instance.launch()
        
        let skillsSubviewButton = app.instance.buttons["Skills"]
        
        app.assertButtonExistsAndTap(button: skillsSubviewButton)
        
        for index in 0..<3 {
            let horizontalVelocity: XCUIGestureVelocity = index > 0 ? .fast : .slow
            app.instance.swipeLeft(velocity: horizontalVelocity)
            app.instance.swipeRight(velocity: horizontalVelocity)
            app.instance.swipeUp(velocity: .fast)
            app.instance.swipeDown(velocity: .slow)
        }

        let closeButton = app.instance.buttons["closeButton"]
        app.assertButtonExistsAndTap(button: closeButton)
        
        XCTAssertNotNil(self.mockedApp)
    }
    
    
    func testOpenContactsWebView() throws {
        guard let app = self.mockedApp else { return }
        
        app.instance.launch()
        
        let contactsSubviewButton = app.instance.buttons["Contact"]
        
        app.assertButtonExistsAndTap(button: contactsSubviewButton)
        
        AvailableContacts.allCases.forEach {
            let contactButton = app.instance.buttons[$0.description]
            
            app.assertButtonExistsAndTap(button: contactButton)

            XCTAssert(contactButton.waitForExistence(timeout: 1))

            // Dismiss the modal
            app.instance.swipeDown(velocity: .fast)
        }
        XCTAssertNotNil(self.mockedApp)
    }
    
    func testOpenAndCloseAllModals() throws {
        guard let app = self.mockedApp else { return }
        
        app.instance.launch()
        MainScreenSubview.allCases.forEach {
            let button = app.instance.buttons[$0.description]
            
            app.assertButtonExistsAndTap(button: button)
            app.instance.swipeUp()
            app.instance.swipeDown()
            
            if $0 == .apps || $0 == .skills || $0 == .languages {
                app.instance.swipeRight()
                app.instance.swipeLeft()
            }
            
            let closeButton = app.instance.buttons["closeButton"]
            
            app.assertButtonExistsAndTap(button: closeButton)
            
            // Last item
            if $0 == .contact {
                XCTAssertFalse(closeButton.waitForExistence(timeout: 0.5))
            }
        }
    }
    
}

final class ModalViewUITests: XCTestCase {
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
}
