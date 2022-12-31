//
//  WebViewRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import struct Foundation.URL

/// Protocol that identifies which types can be presented using WebKit's WKWebView
protocol WebViewRepresentable {
    /// URL of the content to be presented
    var url: URL { get }
}
