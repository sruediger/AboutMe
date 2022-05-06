//
//  MainScreenUITests.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import XCTest

final class MainScreenUITests: AboutMeUITests {
    
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
            
            let button = app.instance.buttons[app.localizedString($0.description, self.classForCoder)]
            XCTAssert(button.exists)
            XCTAssert(button.waitForExistence(timeout: 0.5))
        }
    }
    
    func testStaticTexts() throws {
        guard let app = self.mockedApp else { return }
        app.mainScreenTexts.forEach {
            let text = app.instance.staticTexts[app.localizedString($0, self.classForCoder)]
            XCTAssert(text.exists)
        }
    }
}
