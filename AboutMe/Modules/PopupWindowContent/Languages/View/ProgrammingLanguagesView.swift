//
//  ProgrammingLanguagesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Programming Languages subview presented by the PopupView
internal struct ProgrammingLanguagesView: ViewFactory, WebViewHandler {
    /// Programming language's collection
    let languages: [ProgrammingLanguage]
    
    init(languages: [ProgrammingLanguage] = ProgrammingLanguage.allCases) {
        self.languages = languages
    }

    @ViewBuilder
    /// Creates the main Content View
    /// - Returns ProgrammingLanguagesView ContentView
    func createContentView() -> some View {
        HorizontalCarouselView(items: self.languages) {
            self.update(subject: .init(self.languages[$0].url))
        }
    }
}
