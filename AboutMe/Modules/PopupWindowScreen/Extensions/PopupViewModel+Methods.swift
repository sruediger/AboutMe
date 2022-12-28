//
//  PopupViewModel+Methods.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIDevice
import class UIKit.UIScreen
import class UIKit.UIApplication
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat

internal extension PopupViewModel {
    
    /// Fetch a specific subview's vertical scroll indicator visibility
    /// - Parameter subview: Subview that contains the VScroll
    /// - Returns Bool indicating if the indicator is visible
    func getVScrollIndicator(from subview: MainScreenSubview?) -> Bool {
        switch subview {
            case .contact, .languages: return false
            case .apps, .achievements, .experience, .skills: return true
            case .none: return false
        }
    }
    
    /// Perform the action of an WebViewRepresentable item when it's tapped
    /// - Parameter webItem: The WebViewRepresentable tapped item
    func openOnTap(webItem: WebViewRepresentable) {
        self.webView.contentURL = webItem.url
        if webItem.url.absoluteString.contains("itms-apps") {
            UIApplication.shared.open(webItem.url, options: [:], completionHandler: nil) // Open app Store (unavailable on simulator)
        } else { self.webView.show = true }
    }

    /// Fetch a specific subview content size
    /// - Parameters
    ///     - Parameter content: Optional<MainScreenSubview> instance
    ///     - Parameter screenDimensions: CGSize representing the screen
    /// - Returns CGSize containing the content size width and height
    func getSizeOf(content: MainScreenSubview?, deviceInLandscape: Bool, for screenDimensions: CGSize) -> CGSize {
        guard let subview = content else { return .zero }
        let deviceWidth = screenDimensions.width
        let deviceHeight = screenDimensions.height
        let width: CGFloat = deviceWidth - (self.currentDevice == .pad ? (deviceWidth * 0.42) : 40)
        var height: CGFloat = 0
        
        switch subview {
            case .contact: height = deviceHeight * 0.32
            case .achievements, .experience, .languages: height = deviceHeight * (subview == .languages ? 0.35 : 0.38)
            case .skills, .apps: height = deviceHeight * 0.48
        }
        
        if deviceHeight <= 667 { // iPhone 8/SE2 or lower
        //    height -= (height * 0.005)
        }else if self.currentDevice == .pad {
            height -= (height * 0.32)
        }
        
        let widthGreaterThanHeight: Bool = deviceWidth > deviceHeight
        let orientationChanged: Bool = deviceInLandscape || widthGreaterThanHeight
        
        return CGSize(
            width: width * (orientationChanged ? 0.64 : 1),
            height: height * (orientationChanged ? 1.48 : 1)
        )
    }
}
