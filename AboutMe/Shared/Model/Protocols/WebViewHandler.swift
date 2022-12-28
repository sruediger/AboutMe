//
//  WebViewHandler.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

/// Protocol that defines a WebViewHandler which handles a WebViewRepresentable action
protocol WebViewHandler {
    /// WebViewRepresentable action
    associatedtype Callback where Callback == ((WebViewRepresentable) -> Void)
    /// Action that happens after interacting with the WebViewRepresentable
    var completionHandler: Callback { get }
}
