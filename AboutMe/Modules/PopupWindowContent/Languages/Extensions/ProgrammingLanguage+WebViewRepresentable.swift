//
//  ProgrammingLanguage+WebViewRepresentable.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct Foundation.URL

extension ProgrammingLanguage: WebViewRepresentable {
    
    /// Programming Language wikipedia page URL
    internal var url: URL {
        let localeCode: String
        let localeModifier: String
        
//        if Locale.current.identifier.contains("en") {
            localeCode = "en"
            localeModifier = "programming_language"
//        }
        
        let baseURL: String = "https://\(localeCode).wikipedia.org/wiki/"
        
        switch self {
            case .cpp: return URL(string: baseURL.appending("C%2B%2B"))!
            case .objectiveC: return URL(string: baseURL.appending("Objective-C"))!
            case .shellScript: return URL(string: baseURL.appending("Shell_script"))!
            default: return URL(string: baseURL.appending("\(self.description)_(\(localeModifier))"))!
        }
    }
}
