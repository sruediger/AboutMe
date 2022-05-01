//
//  MainScreenViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 28/04/22.
//

import CoreGraphics
import UIKit

struct MainScreenViewModel {    
    internal var presentedSubview: MainScreenSubview? = nil
    
    internal var horizontalCardViewPadding: CGFloat { UIDevice.current.userInterfaceIdiom == .pad ? 40 : 10 }


}

extension MainScreenViewModel {
    
    internal func getSubviews(fromIndex index: Int) -> [MainScreenSubview] {
        
        switch index {
            case 0: return [.languages, .skills]
            case 1: return [.apps, .experience]
            case 2: return [.curiosities, .contact]
            default: return []
        }
    }
    
    internal mutating func set(subview: MainScreenSubview) {
        self.presentedSubview = subview
    }
    
}
