//
//  HapticsManager.swift
//  Secretly
//
//  Created by Sérgio Ruediger on 14/01/22.
//

import class UIKit.UIImpactFeedbackGenerator

/// Structure that manages the system haptics
struct HapticsManager {
    typealias HapticType = UIImpactFeedbackGenerator.FeedbackStyle
    
    /// Trigger and activate a haptic feedback
    /// - Parameter type: Type of the Haptic Feedback
    public static func trigger(_ type: HapticType) {
        UIImpactFeedbackGenerator(style: type).impactOccurred()
    }
}
