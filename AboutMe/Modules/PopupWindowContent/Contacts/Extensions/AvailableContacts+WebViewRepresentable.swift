//
//  AvailableContacts+WebViewRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct Foundation.URL

extension AvailableContacts: WebViewRepresentable {
    /// Contact page URL
    internal var url: URL {
        switch self {
            case .linkedIn: return URL(string: "https://linkedin.com/in/sergiogruediger")!
            case .github: return URL(string: "https://github.com/sruediger")!
            case .telegram: return URL(string: "https://t.me/sgruediger")!
        }
    }
}
