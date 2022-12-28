//
//  ProgrammingLanguagesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Programming Languages subview presented by the PopupView
internal struct ProgrammingLanguagesView: ViewFactory, WebViewHandler {
    /// Action that happens when a language is tapped
    let completionHandler: Callback
    
    @ViewBuilder
    /// Creates the main Content View
    /// - Returns ProgrammingLanguagesView ContentView
    func createContentView() -> some View {
        HorizontalCarouselView(items: ProgrammingLanguage.allCases) { tappedLanguageIndex in
            // - MARK: TODO Implementation
            let selectedLanguage: ProgrammingLanguage = ProgrammingLanguage.allCases[tappedLanguageIndex]
            self.completionHandler(selectedLanguage)
        }
    }
}
