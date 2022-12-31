//
//  PopupViewUITests.swift
//  AboutMeUITests
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import XCTest

final class PopupViewUITests: AboutMeUITests {
        
    func testOpenAndCloseAllPopups() throws {
        XCTAssertNoThrow(try self.testOpenAndCloseAllPopups(withAutoLayout: false))
        XCTAssertNoThrow(try self.testOpenAndCloseAllPopups(withAutoLayout: true))
    }
    
    func testOpenAndCloseAllPopups(withAutoLayout: Bool) throws {
        guard let app = self.mockedApp else { return }
                
        MainScreenSubview.allCases.forEach {
            let button = app.instance.buttons[app.localizedString($0.name, self.classForCoder)]
            
            app.assertButtonExistsAndTap(button: button, customTimeout: 0.5)
            
            if withAutoLayout {
                for _ in 0..<4 { app.toggleOrientation(of: XCUIDevice.shared) }
            }
            
            let subviewHasVerticalScroll: Bool = ($0 != .languages)
            let subviewHasHorizontalScroll: Bool = ($0 != .achievements && $0 != .experience)
            
            if $0 != .contact, !app.iPadDevice {
                if subviewHasHorizontalScroll { app.instance.swipeRight() }
                if subviewHasVerticalScroll {
                    app.instance.swipeUp()
                    app.instance.swipeDown()
                }
                if subviewHasHorizontalScroll { app.instance.swipeLeft() }
            }
            
            let closeButton = app.instance.buttons["closeButton"]
            
            XCTAssert(closeButton.isHittable)
            app.assertButtonExistsAndTap(button: closeButton)
            
            // Last item
            if $0 == .contact {
                XCTAssertFalse(closeButton.waitForExistence(timeout: 0.5))
            }
        }
    }
}

// - MARK: Scroll tests

internal extension PopupViewUITests {
    
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
}

// - MARK: WebView tests

internal extension PopupViewUITests {
    
    func testOpenLanguagesWebView() throws {
        XCTAssertNoThrow(try self.testOpenWebView(from: .languages))
    }
    
    func testOpenAppsWebView() throws {
        XCTAssertNoThrow(try self.testOpenWebView(from: .apps))
    }
    
    func testOpenAchievementsWebView() throws {
        XCTAssertNoThrow(try self.testOpenWebView(from: .achievements))
    }
    
    func testOpenContactsWebView() throws {
        XCTAssertNoThrow(try self.testOpenWebView(from: .contact))
    }
    
    func testOpenWebView(from subview: MainScreenSubview) throws {
        guard subview != .skills, subview != .experience else { return }
        guard let app = self.mockedApp else { return }
                
        let subviewButton = app.instance.buttons[app.localizedString(subview.identifier, self.classForCoder)]
        
        app.assertButtonExistsAndTap(button: subviewButton)
        
        if let subviewItems = subview.allItems {
            subviewItems.forEach {
                let buttonIdentifier: String
                
                if $0 is Achievement {
                    buttonIdentifier = $0.name
                } else { buttonIdentifier = $0.description }
                
                let itemButton = app.instance.buttons[buttonIdentifier]
                
                app.assertButtonExistsAndTap(button: itemButton)
                XCTAssert(itemButton.waitForExistence(timeout: 1.5))

                while !itemButton.isHittable { // Dismiss the webview's sheet
                    app.instance.swipeDown(velocity: .fast)
                }
            }
        }
        
        XCTAssertNotNil(self.mockedApp)
    }
}
