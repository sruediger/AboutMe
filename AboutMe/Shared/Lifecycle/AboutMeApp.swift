//
//  AboutMeApp.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import protocol SwiftUI.App
import protocol SwiftUI.Scene
import struct SwiftUI.WindowGroup
import enum SwiftUI.DynamicTypeSize

@main
struct AboutMeApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreenView()
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        }
        #if targetEnvironment(macCatalyst) || canImport(AppKit)
            .windowStyle(.hiddenTitleBar)
        #endif
    }
}
