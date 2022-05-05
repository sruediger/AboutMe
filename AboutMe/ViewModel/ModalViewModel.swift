//
//  ModalViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import CoreGraphics
import UIKit

/// Structure used to control the ModalView
struct ModalViewModel {
    /// Tuple used to instantiate an WKWebView
    internal var webView: (show: Bool, contentURL: URL) = (false, .init(string: "https://developer.apple.com")!)
    
    /// Computed property that checks if the device is in portrait mode
    internal var deviceInPortraitMode: Bool {
        UIScreen.main.bounds.width > UIScreen.main.bounds.height
    }
}

/// ModalViewModel+Methods
extension ModalViewModel {
    
    /// Fetch a specific subview's vertical scroll indicator visibility
    /// - Parameter subview: Subview that contains the VScroll
    /// - Returns Bool indicating if the indicator is visible
    internal func getVScrollIndicator(from subview: MainScreenSubview?) -> Bool {
        switch subview {
            case .languages, .contact: return false
            case .skills, .apps, .experience, .curiosities: return true
            case .none: return false
        }
    }
    
    /// Perform the action of an WebViewRepresentable item when it's tapped
    /// - Parameter webItem: The WebViewRepresentable tapped item
    internal mutating func tapped(webItem: WebViewRepresentable) {
        self.webView.contentURL = webItem.url
        if webItem.url.absoluteString.contains("itms-apps") { // Open app Store (unavailable on simulator)
            UIApplication.shared.open(webItem.url, options: [:], completionHandler: nil)
        }else { // Open Safari Preview
            self.webView.show = true
        }
    }

    /// Fetch a specific subview content size
    /// - Parameter content: Optional<MainScreenSubview> instance
    /// - Returns CGSize containing the content size width and height
    internal func getSizeOf(content: MainScreenSubview?) -> CGSize {
        guard let subview = content else { return .zero }
        let deviceWidth = UIScreen.main.bounds.width
        let deviceHeight = UIScreen.main.bounds.height
        let width: CGFloat = deviceWidth - (UIDevice.current.userInterfaceIdiom == .pad ? (deviceWidth * 0.42) : 40)
        var height: CGFloat = 0
        
        switch subview {
            case .languages, .contact: height = deviceHeight * 0.32
            case .experience, .curiosities: height = deviceHeight * 0.38
            case .skills, .apps: height = deviceHeight * 0.48
        //    default: height = deviceHeight * 0.5
        }
        
        if deviceHeight <= 667 { // iPhone 8/SE2 or lower
        //    height -= (height * 0.005)
        }else if UIDevice.current.userInterfaceIdiom == .pad {
            height -= (height * 0.32)
        }
        
        return CGSize(width: width, height: height)
    }
}
