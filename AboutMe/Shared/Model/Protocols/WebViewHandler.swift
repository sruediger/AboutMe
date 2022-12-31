//
//  WebViewHandler.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct Foundation.URL
import class Combine.CurrentValueSubject

/// Protocol that defines a WebViewHandler which handles a WebViewRepresentable action
protocol WebViewHandler {
    
    /// WebView's CurrentValueSubject
    associatedtype WebViewSubject where WebViewSubject == CurrentValueSubject<URL, Never>
    
    /// Updates the WebView's presented URL
    /// - Parameter subject: The WebView CurrentValueSubject that will be presented
    func update(subject: WebViewSubject)
}

/// WebViewHandler+DefaultImplementations
internal extension WebViewHandler {
    
    /// Updates the WebView's presented URL
    /// - Parameter subject: The WebView CurrentValueSubject that will be presented
    func update(subject: WebViewSubject) {
        NotificationManager
            .post(to: .onWebViewURLUpdate, value: subject)
    }
}
