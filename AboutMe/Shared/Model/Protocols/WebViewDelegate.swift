//
//  WebViewDelegate.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct Foundation.URL

/// Protocol that defines a WebViewDelegate
protocol WebViewDelegate {
    /// Tuple<Bool, URL> that represents the WebViewData
    associatedtype WebViewData where WebViewData == (show: Bool, contentURL: URL)

    /// Main property used to manage the data
    var webView: WebViewData { get set }
    
    /// Perform an WebViewRepresentable item's action when tapped
    /// - Parameter webItem: The WebViewRepresentable tapped item
    func openOnTap(webItem: WebViewRepresentable)
}
