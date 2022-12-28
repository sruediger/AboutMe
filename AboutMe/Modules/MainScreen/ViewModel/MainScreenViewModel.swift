//
//  MainScreenViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import class UIKit.UIColor
import class UIKit.UIDevice
import class UIKit.UIBlurEffect
import struct SwiftUI.Published
import struct CoreGraphics.CGFloat
import protocol Foundation.ObservableObject
import class UIKit.UINavigationBarAppearance

/// Structure used to control the MainScreenView
final class MainScreenViewModel: ObservableObject, UserDevice {
    /// Subview that will be opened by the PopupView
    @Published internal var presentedSubview: MainScreenSubview?
    /// Styled UINavigationBarAppearance
    private var customNavBarAppearance: any CustomNavigationBarAppearance
    
    init(presentedSubview: MainScreenSubview? = nil, navBarAppearance: some CustomNavigationBarAppearance = BlurredNavigationBarAppearance()) {
        self.presentedSubview = presentedSubview
        self.customNavBarAppearance = navBarAppearance
    }
}

/// MainScreenViewModel+ComputedProperties
internal extension MainScreenViewModel {
    
    /// MainScreen popup window's blur radius
    var popupWindowBlurRadius: CGFloat { self.presentedSubview == nil ? 0 : 8 }
    
    /// Horizontal padding of the main screen card view
    var horizontalCardViewPadding: CGFloat { self.currentDevice == .pad ? 40 : 10 }
    
    /// App's custom UINavigationBarAppearance instance
    var navigationBarAppearence: UINavigationBarAppearance { self.customNavBarAppearance.defaultSettings }
}

/// MainScreenViewModel+Methods
internal extension MainScreenViewModel {
    
    /// Fetch main screen subviews based on the row index
    /// - Parameter index: Index of the main screen buttons rows
    /// - Returns Array<MainScreenSubview> for the specific index
    func getSubviews(fromIndex index: Int) -> [MainScreenSubview] {
        switch index {
            case 0: return [.languages, .skills]
            case 1: return [.apps, .experience]
            case 2: return [.achievements, .contact]
            default: return []
        }
    }
    
    /// Set a MainScreenSubview to be presented
    /// - Parameter subview: Subview to present
    func set(subview: MainScreenSubview) {
        guard self.presentedSubview == nil else { return }
        self.presentedSubview = subview
        HapticsManager.trigger(.heavy)
    }
}
