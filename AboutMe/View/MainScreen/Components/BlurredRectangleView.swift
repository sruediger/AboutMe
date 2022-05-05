//
//  BlurredRectangleView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import SwiftUI

/// A blurred rectangle view
struct BlurredRectangleView: View {
    /// Blur effect style
    internal let style: UIBlurEffect.Style
    /// Rectangle's foreground color
    internal let foregroundColor: Color
    /// Rectangle's corner radius
    internal let cornerRadius: CGFloat
    /// Rectangle's shadow radius
    internal let shadowRadius: CGFloat
    
    var body: some View {
        Rectangle()
            .background(BlurredView(style: style))
            .foregroundColor(foregroundColor)
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
            .opacity(0.96)
    }
    
}
