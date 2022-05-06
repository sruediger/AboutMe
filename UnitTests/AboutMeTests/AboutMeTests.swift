//
//  AboutMeTests.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import XCTest
@testable import AboutMe

extension AboutMeTests {
    
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
    internal func testLoadAssets() {
        print("Trying to load all AboutMeApp assets...")
        if let assets = self.dummy?.assets {
            assets.forEach { XCTAssertNotNil($0) }
        }else { XCTAssertNil(nil) }
    }
    
    /// Test if the URLs used by the app are valid
    internal func testLoadURLs() {
        print("Trying to load all Sergio's contacts & apps URLs...")
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

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
