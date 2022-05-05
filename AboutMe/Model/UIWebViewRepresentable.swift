//
//  UIWebViewRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import SwiftUI
import WebKit
 
/// Structure used to create WKWebView instances
struct WebView: UIViewRepresentable {
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
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
