//
//  OrientationManager.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIDevice
import struct SwiftUI.Published
import class UIKit.UIApplication
import class UIKit.UIWindowScene
import class Combine.AnyCancellable
import enum UIKit.UIDeviceOrientation
import class Foundation.NotificationCenter
import protocol Foundation.ObservableObject

/// Class that manages the user's device orientation state
open class OrientationManager: ObservableObject {
    /// User device orientation state
    @Published private(set) var type: UIDeviceOrientation = .unknown
    /// Combine publisher cancellables
    private var cancellables: Set<AnyCancellable> = []
    /// Class singleton's shared instance
    public static let shared = OrientationManager()

    private init() {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let sceneDelegate = scene as? UIWindowScene else { return }
        
        let orientation = sceneDelegate.interfaceOrientation
        
        switch orientation {
            case .portrait: type = .portrait
            case .portraitUpsideDown: type = .portraitUpsideDown
            case .landscapeLeft: type = .landscapeLeft
            case .landscapeRight: type = .landscapeRight
                
            default: type = .unknown
        }
        
        NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink() { [weak self] _ in
                self?.type = UIDevice.current.orientation
            }
            .store(in: &cancellables)
    }
}
