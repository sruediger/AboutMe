//
//  ProgrammingLanguagesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

struct ProgrammingLanguagesView: View {
    var body: some View {
        HorizontalCarouselView(items: ProgrammingLanguages.allItems) { tappedLanguageIndex in
            // - MARK: TODO Implementation
            print("tapped \(ProgrammingLanguages.allCases[tappedLanguageIndex])")
        }
    }
}
