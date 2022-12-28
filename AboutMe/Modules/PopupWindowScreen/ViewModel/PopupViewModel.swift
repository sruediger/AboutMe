//
//  PopupViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import struct SwiftUI.Published
import struct CoreGraphics.CGFloat
import protocol Foundation.ObservableObject

/// Structure used to control the PopupView
final class PopupViewModel: ObservableObject, UserDevice, WebViewDelegate {
    @Published internal var webView: WebViewData
    internal let animationDuration: CGFloat
        
    public init(webView: WebViewData = (false, .init(string: "https://developer.apple.com")!), animationDuration: CGFloat = 0.125) {
        self.webView = webView
        self.animationDuration = animationDuration
    }
}
