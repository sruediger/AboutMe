//
//  Application+WebViewRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct Foundation.URL

extension Application: WebViewRepresentable {
    /// App Store URL
    internal var url: URL {
        #if targetEnvironment(simulator)
            return URL(string: "https://developer.apple.com")! // For some reason iOS simulators cannot open App Store links, even with the original https apps.apple.com url.
        #else
            let appStoreURL: String = "itms-apps://itunes.apple.com/us/app/apple-store/"
            switch self {
                case .faunaVsBunny: return URL(string: appStoreURL.appending("id1578548717"))!
                case .catchNap: return URL(string: appStoreURL.appending("id1592372877"))!
                case .fonospace: return URL(string: appStoreURL.appending("id1609281831"))!
                case .iHasher: return URL(string: appStoreURL.appending("id1586542328"))!
                case .secretly: return URL(string: appStoreURL.appending("id1606237250"))!
                case .pluty: return URL(string: appStoreURL.appending("id1629715354"))!
                case .noty: return URL(string: appStoreURL.appending("id1644401695"))!
            }
        #endif
    }
}
