//
//  OrientationManager.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIDevice
import struct Combine.Published
import class UIKit.UIApplication
import class UIKit.UIWindowScene
import class Combine.AnyCancellable
import enum UIKit.UIDeviceOrientation
import protocol Combine.ObservableObject

/// Class that manages the user's device orientation state
open class OrientationManager: ObservableObject {
    /// User device orientation state
    @Published private(set) var type: UIDeviceOrientation = .unknown
    /// Combine publisher cancellables
    private var disposables: Set<AnyCancellable> = []
    /// Class singleton's shared instance
    public static let shared = OrientationManager()

    private init() {
        if let scene = UIApplication.shared.connectedScenes.first,
           let sceneDelegate = scene as? UIWindowScene,
           let deviceOrientation = UIDeviceOrientation(rawValue: sceneDelegate.interfaceOrientation.rawValue) {
            self.type = deviceOrientation
            
            self.orientationNotification
                .store(in: &disposables)
        }
    }
    
    /// Subscriber of UIDevice's orientationDidChangeNotification
    private lazy var orientationNotification: AnyCancellable = {
        NotificationManager
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { [weak self] _ in
                self?.type = UIDevice.current.orientation
            }
    }()
}
