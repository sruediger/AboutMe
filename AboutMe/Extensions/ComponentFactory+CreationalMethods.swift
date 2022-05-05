//
//  ComponentFactory+CreationalMethods.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

extension ComponentFactory {
    
    @ViewBuilder public static func create(backgroundWithColor color: Color) -> some View {
        color.ignoresSafeArea()
    }
    
    @ViewBuilder public static func create(imageFromPath path: String, dimensions: CGSize, system: Bool = false, customColor: Color? = nil) -> some View {
        let imageView: Image = (system ? Image(systemName: path) : Image(path))
        let imageColor: Color = (customColor ?? (system ? .white : .clear))
        
        imageView
            .resizable()
            .frame(width: dimensions.width, height: dimensions.height)
            .foregroundColor(imageColor)
    }
    
    @ViewBuilder public static func create(buttonWithDimensions dimensions: CGSize, imagePath: String, customColor: Color = .secondary, customPadding: CGFloat = 5, _ completionHandler: @escaping () -> Void) -> some View {
        Button(action: completionHandler) {
            Image(systemName: imagePath)
                .resizable()
                .frame(width: dimensions.width, height: dimensions.height)
                .foregroundColor(customColor)
                .padding(customPadding)
        }.accessibilityIdentifier("closeButton")
    }
    
    // Warning: Must be embed in a VStack
    @ViewBuilder public static func create(plainListContent contents: [String], withBulletPoint: Bool = false, customFont: Font = .body) -> some View {
        ForEach(contents.indices, id: \.self) { index in
            let textContent = (withBulletPoint ? "• \(contents[index])" : contents[index])
            Text(textContent)
                .font(customFont)
                .fontWeight(.medium)
            
            Divider()
        }.padding(.leading, 15).padding(.trailing, 15)
    }
}


