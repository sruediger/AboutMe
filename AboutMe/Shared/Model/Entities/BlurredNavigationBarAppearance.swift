//
//  BlurredNavigationBarAppearance.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIColor
import class UIKit.UIBlurEffect

/// Structure that implements the BlurredNavigationBarAppearance default settings
struct BlurredNavigationBarAppearance: CustomNavigationBarAppearance {

    /// Fetches a blurred styled UINavigationBarAppearance
    lazy var defaultSettings: Appearance = {
        let appearance: Appearance = .init()
        
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemThinMaterial)
        
        if let backgroundColor = UIColor(named: "Colors/background") {
            appearance.backgroundColor = backgroundColor.withAlphaComponent(0.5)
        }
        
        return appearance
    }()
}
