//
//  PopupViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import struct Foundation.URL
import struct Combine.Published
import struct CoreGraphics.CGFloat
import class Combine.AnyCancellable
import class Combine.CurrentValueSubject
import protocol Combine.ObservableObject

/// Structure used to control the PopupView
final class PopupViewModel: ObservableObject, DeviceProperties, WebViewDelegate {
    /// WebViewData manager
    @Published var webView: WebViewData
    /// Duration of the animation that happens when the PopupView appears
    let animationDuration: CGFloat
    /// Combine's WebView disposable tasks subscriptions
    var disposableTasks: Set<AnyCancellable>
    
    public init(webView: WebViewData = (false, .defaultWebViewURL), animationDuration: CGFloat = 0.125) {
        self.webView = webView
        self.animationDuration = animationDuration
        self.disposableTasks = .init()
    
        self.webViewNotification
            .store(in: &self.disposableTasks)
    }
    
    /// Subscriber of the onWebViewURLUpdate notification
    private lazy var webViewNotification: AnyCancellable = {
        NotificationManager
            .publisher(for: .onWebViewURLUpdate)
            .map {
                if let webViewSubject = $0.object as? CurrentValueSubject<URL, Never> {
                    return webViewSubject.value
                }
                return self.webView.contentURL
            }
            .assign(to: \.webView.contentURL, on: self)
    }()
}
