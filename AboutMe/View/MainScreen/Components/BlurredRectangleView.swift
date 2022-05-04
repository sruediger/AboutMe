//
//  BlurredRectangleView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import SwiftUI


struct BlurredRectangleView: View {
    internal let style: UIBlurEffect.Style
    internal let foregroundColor: Color
    internal let cornerRadius: CGFloat
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
