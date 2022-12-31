//
//  URL+Utils.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/12/22.
//

import struct Foundation.URL

internal extension URL {
    
    /// Boolean that Indicates if the URL instance is an App Store link
    var isAppStoreURL: Bool { self.absoluteString.contains("itms-apps") }
    
    /// Default URL used as a fallback between the app's WebViews
    static var defaultWebViewURL: Self { .init(string: "https://developer.apple.com")! }
    
}
