//
//  NotificationManager.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/12/22.
//

import struct Combine.AnyPublisher
import struct Foundation.Notification
import class Foundation.NotificationCenter

/// Class that handles the App's notifications
final class NotificationManager {
    /// Notification's name shorthand typealias
    typealias NotificationID = Notification.Name
    /// A subscribed NotificationCenter Publisher's Output
    typealias Output = NotificationCenter.Publisher.Output
    /// App's default NotificationCenter
    private static let notificationCenter: NotificationCenter = .default

    /// Posts a notification with the specified value via NotificationCenter
    /// - Parameters
    ///     - Parameter name: Notification's identifier
    ///     - Parameter value: Object to be posted as the notification content
    static func post(to name: NotificationID, value: Any?) {
        Self.notificationCenter
            .post(name: name, object: value)
    }
    
    /// Fetches a publisher based on it's key
    /// - Parameter key: Publisher's key identifier, aka notification name
    /// - Returns AnyPublisher<Output, Never> representing the desired Publisher type-erased
    static func publisher(for key: NotificationID) -> AnyPublisher<Output, Never> {
        Self.notificationCenter
            .publisher(for: key)
            .eraseToAnyPublisher()
    }
}

internal extension Notification.Name {
    /// Notification key for handling WebView URL updates subscriptions
    static let onWebViewURLUpdate: Self = .init("WebViewURL")
}
