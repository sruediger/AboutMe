//
//  ModalViewUITests.swift
//  AboutMeUITests
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import XCTest

final class ModalViewUITests: AboutMeUITests {
    
    func testScrollLanguages() throws {
        guard let app = self.mockedApp else { return }
                
        let languagesSubviewButton = app.instance.buttons[app.localizedString("BTNLanguages", self.classForCoder)]
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
        
        let skillsSubviewButton = app.instance.buttons[app.localizedString("BTNSkills", self.classForCoder)]
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
        
        let contactsSubviewButton = app.instance.buttons[app.localizedString("BTNContact", self.classForCoder)]
        app.assertButtonExistsAndTap(button: contactsSubviewButton)
        
        AvailableContacts.allCases.forEach {
            let contactButton = app.instance.buttons[$0.description]
            
            app.assertButtonExistsAndTap(button: contactButton)
            XCTAssert(contactButton.waitForExistence(timeout: 1.5))

            // Dismiss the modal
            app.instance.swipeDown(velocity: .fast)
        }
        XCTAssertNotNil(self.mockedApp)
    }
    
    func testOpenAndCloseAllModals() throws {
        XCTAssertNoThrow(try self.testOpenAndCloseAllModals(withAutoLayout: false))
        XCTAssertNoThrow(try self.testOpenAndCloseAllModals(withAutoLayout: true))
    }
    
    func testOpenAndCloseAllModals(withAutoLayout: Bool) throws {
        guard let app = self.mockedApp else { return }
                
        MainScreenSubview.allCases.forEach {
            let button = app.instance.buttons[app.localizedString($0.description, self.classForCoder)]
            
            app.assertButtonExistsAndTap(button: button, customTimeout: 0.5)
            
            if withAutoLayout {
                for _ in 0..<4 { app.toggleOrientation(of: XCUIDevice.shared) }
            }
            
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
