//
//  BlurredView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import class UIKit.UIBlurEffect
import class UIKit.UIVisualEffectView
import protocol SwiftUI.UIViewRepresentable

/// Structure used to create UIVisualEffectView instances
internal struct BlurredView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    /// Creates a custom UIView with the specified context and style
    /// - Parameter context : Current context instance
    /// - Returns UIVisualEffectView view
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    /// Updates the presenting UIViewController
    /// - Parameters
    ///     - Parameter uiViewController: Presenting view controller
    ///     - Parameter context: The current context instance
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { /* nothing to do here */ }
}
