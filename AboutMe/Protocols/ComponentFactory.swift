//
//  ComponentFactory.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import SwiftUI

/// Protocol used to create simple and reusable components
internal protocol ComponentFactory {
    
    associatedtype ComponentView: View

    @ViewBuilder static func create(backgroundWithColor color: Color) -> ComponentView
  
//    @ViewBuilder static func create(imageFromPath path: String, dimensions: CGSize, system: Bool, customColor: Color?) -> ComponentView
    
//    @ViewBuilder static func create(buttonWithDimensions dimensions: CGSize, imagePath: String, customColor: Color, customPadding: CGFloat, _ completionHandler: @escaping () -> Void) -> ComponentView
    
//    @ViewBuilder static func create(plainListContent contents: [String], withBulletPoint: Bool, customFont: Font) -> ComponentView
}
