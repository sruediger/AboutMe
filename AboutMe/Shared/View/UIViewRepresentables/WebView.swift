//
//  WebView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import struct Foundation.URL
import class WebKit.WKWebView
import struct Foundation.URLRequest
import protocol SwiftUI.UIViewRepresentable
import class Dispatch.DispatchQueue

/// Structure used to create WKWebView instances
internal struct WebView: UIViewRepresentable {
    /// URL of the page that will be opened in an SafariPreview
    var url: URL
 
    /** Creates a custom UIView with the specified context and style
        - Parameter context : Current context instance
        - Returns WKWebView */
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    /** Updates the presented UIViewController
        - Parameters
            - Parameter webView: Presented view controller
            - Parameter context: The current context instance */
    func updateUIView(_ webView: WKWebView, context: Context) {
        // The purple warning "This method should not be called on the main thread as it may lead to UI unresponsiveness" caused by WKWebView's load method is a known issue and, according to an Apple DTS engineer it may be ignored when the backtrace is composed entirely of system code, which happens here. Detailed explanation at: https://developer.apple.com/forums/thread/714467
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
