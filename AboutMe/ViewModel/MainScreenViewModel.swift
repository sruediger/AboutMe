//
//  MainScreenViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import CoreGraphics
import UIKit

/// Structure used to control the MainScreenView
struct MainScreenViewModel {
    /// Subview that will be opened by the ModalView
    internal var presentedSubview: MainScreenSubview? = nil
    
    /// Horizontal padding of the main screen card view
    internal var horizontalCardViewPadding: CGFloat { UIDevice.current.userInterfaceIdiom == .pad ? 40 : 10 }
    
    /// App's custom UINavigationBarAppearence instance
    internal lazy var navigationBarAppearence: UINavigationBarAppearance = {
        let appearence = UINavigationBarAppearance()
        
        appearence.configureWithTransparentBackground()
        appearence.backgroundColor = (UIColor(named: "Colors/background") ?? .clear).withAlphaComponent(0.5)
        appearence.backgroundEffect = UIBlurEffect(style: .systemThinMaterial)
        
        return appearence
    }()

}

/// MainScreenViewModel+Methods
extension MainScreenViewModel {
    
    /// Fetch main screen subviews based on the row index
    /// - Parameter index: Index of the main screen buttons rows
    /// - Returns Array<MainScreenSubview> for the specific index
    internal func getSubviews(fromIndex index: Int) -> [MainScreenSubview] {
        switch index {
            case 0: return [.languages, .skills]
            case 1: return [.apps, .experience]
            case 2: return [.curiosities, .contact]
            default: return []
        }
    }
    
    /// Set a MainScreenSubview to be presented
    internal mutating func set(subview: MainScreenSubview) {
        guard self.presentedSubview == nil else { return }
        self.presentedSubview = subview
    }
    
}
