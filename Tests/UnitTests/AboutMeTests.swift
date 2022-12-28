//
//  AboutMeTests.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import XCTest
@testable import AboutMe

internal extension AboutMeTests {
    
    func testAllLocalizations() {
        let locales = ["en", "pt-BR"]
        for locale in locales { verify(localeIdentifier: locale) }
    }
    
    func verify(localeIdentifier: String) {
        guard let path = Bundle.main.path(forResource: localeIdentifier, ofType: "lproj"),
        let bundle = Bundle(path: path) else {
            XCTFail("Missing localization for \(localeIdentifier)"); return
        }

        // Pick any string from the Localizable.strings file; ideally one that's unlikely to be removed ;)
        let string = bundle.localizedString(forKey: "STXMainTitle", value: nil, table: nil)

        XCTAssertFalse(string.isEmpty)
        XCTAssertNotEqual(string, "STXMainTitle")
    }
    
    /// Test if the assets used by the app are in it
    func testLoadAssets() {
        if let assets = self.dummy?.assets {
            assets.forEach { XCTAssertNotNil($0) }
        }else { XCTAssertNil(nil) }
    }
    
    /// Test if the URLs used by the app are valid
    func testLoadURLs() {
        if let urls = self.dummy?.URLs {
            urls.forEach { XCTAssertNotNil($0) }
        }else { XCTAssertNil(nil) }
    }
    
}

class AboutMeTests: XCTestCase {
    /// Object used as the main UnitTests controller and data source
    private var dummy: TestDummy? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.dummy = TestDummy()
    }
    
    override func tearDown()  {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.dummy = nil
    }
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

}
