//
//  WebViewDelegate.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class Combine.Future
import struct Foundation.URL
import class UIKit.UIApplication

/// Protocol that defines a WebViewDelegate
protocol WebViewDelegate: AnyObject {
    
    /// Tuple<Bool, URL> that represents the WebViewData
    associatedtype WebViewData where WebViewData == (show: Bool, contentURL: URL?)

    /// An asynchronous WebView task
    associatedtype WebViewTask where WebViewTask == Future<WebViewData, Never>
    
    /// Main property used to manage the data
    var webView: WebViewData { get set }
    
    @MainActor
    /// Opens a WebPage URL
    /// - Parameter webPageURL: WebPage's URL
    func openURL(_ webPageURL: URL)
    
    /// Action that happens after opening a URL
    /// - Parameter data: WebViewData instance
    func didOpen(_ data: WebViewData)
}

/// WebViewDelegate+DefaultImplementations
internal extension WebViewDelegate {
    // - MARK: Methods
    
    @MainActor
    /// Opens a WebPage URL
    /// - Parameter webPageURL: WebPage's URL
    func openURL(_ webPageURL: URL) {
        webView.contentURL = webPageURL
        if webPageURL.isAppStoreURL { // (Unavailable on simulator)
            UIApplication.shared.open(webPageURL, options: [:], completionHandler: nil)
        } else { webView.show = true }
    }
    
    /// Action that happens after opening a URL
    /// - Parameter webViewData: WebViewData instance
    func didOpen(_ webViewData: WebViewData) {
        self.webView = webViewData
    }
}
