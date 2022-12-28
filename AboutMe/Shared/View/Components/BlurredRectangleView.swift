//
//  BlurredRectangleView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import SwiftUI

/// A blurred rectangle view
struct BlurredRectangleView: ComponentCreator {
    /// Blur effect style
    internal let style: UIBlurEffect.Style
    /// Rectangle's foreground color
    internal let foregroundColor: Color
    /// Rectangle's corner radius
    internal let cornerRadius: CGFloat
    /// Rectangle's shadow radius
    internal let shadowRadius: CGFloat
    
    init(style: UIBlurEffect.Style, foregroundColor: Color, cornerRadius: CGFloat = 20, shadowRadius: CGFloat = 6) {
        self.style = style
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
    }
    
    @ViewBuilder
    /// Creates the main BlurredRectangleView's content view
    /// - Returns BlurredRectangleView
    func create() -> some View {
        Rectangle()
            .background(BlurredView(style: style))
            .foregroundColor(foregroundColor)
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
            .opacity(0.96)
    }
}
