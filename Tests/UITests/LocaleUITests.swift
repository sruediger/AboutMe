//
//  LocaleUITests.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 06/05/22.
//

import XCTest

class LocaleUITests: AboutMeUITests {
    
    func testLaunchAllLocales() throws {
        guard let app = self.mockedApp else { return }
        
        let locales: [String] = ["en_US", "pt_BR"]
        
        locales.forEach {
            let language = $0.components(separatedBy: "_")[0]
            
            app.instance.launchArguments += ["-AppleLanguages", "(\(language))"]
            app.instance.launchArguments += ["-AppleLocale", "\($0)"]
            
            self.mockedApp?.instance.launch()
        }
        
        XCTAssertNotNil(self.mockedApp)
    }

    override open func setUp() {
        NSLog("%@", "setUp")
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.mockedApp = MockedApp()
    }
    
    
}
