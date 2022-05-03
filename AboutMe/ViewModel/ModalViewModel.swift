//
//  ModalViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import CoreGraphics
import UIKit

struct ModalViewModel {
    internal var webView: (show: Bool, contentURL: URL) = (false, .init(string: "https://developer.apple.com")!)
    
    internal var deviceInPortraitMode: Bool {
        UIScreen.main.bounds.width > UIScreen.main.bounds.height
    }
}

/// ModalViewModel+Methods
extension ModalViewModel {
    
    internal func getVScrollIndicator(from subview: MainScreenSubview?) -> Bool {
        switch subview {
            case .languages, .contact: return false
            case .skills, .apps, .experience, .curiosities: return true
            case .none: return false
        }
    }
    
    internal mutating func tapped(webItem: WebViewRepresentable) {
        self.webView.contentURL = webItem.url
        if webItem.url.absoluteString.contains("itms-apps") { // Open app Store
            UIApplication.shared.open(webItem.url, options: [:], completionHandler: nil)
        }else { // Open Safari Preview
            self.webView.show = true
        }
    }
    
    internal func getSkillsTitle(of index: Int) -> String {
        switch index {
            case 0: return "iOS Development"
            case 1: return "Technical Skills"
            case 2: return "Databases"
            case 3: return "Design"
            case 4: return "Soft Skills"
            default: return ""
        }
    }
    
    internal func getSkillsItems(of index: Int) -> [AnimatableScroll] {
        switch index {
            case 0: return TechSkills.iOSDevelopment
            case 1: return TechSkills.generalDevelopment
            case 2: return TechSkills.databases
            case 3: return TechSkills.design
            default: return []
        }
    }
    
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
