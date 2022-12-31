//
//  Achievement+WebViewRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct Foundation.URL

extension Achievement: WebViewRepresentable {
    /// Achievement page URL
    internal var url: URL {
        switch self {
            case .wwdcSwiftStudentChallenge(_): return URL(string: "https://developer.apple.com/wwdc22/swift-student-challenge")!
            case .entrepreneurCamp(_): return URL(string: "https://developer.apple.com/entrepreneur-camp")!
        }
    }
}
