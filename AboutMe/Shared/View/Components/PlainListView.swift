//
//  PlainListView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

/// Structure that creates a plain list view
struct PlainListView: ComponentCreator {
    /// Text content font
    let font: Font
    /// The text content
    let content: [String]
    /// Precedes content items with bullet points when true
    let withBulletPoint: Bool
    
    init(content: [String], font: Font = .body, withBulletPoint: Bool = true) {
        self.font = font
        self.content = content
        self.withBulletPoint = withBulletPoint
    }
        
    @ViewBuilder
    /// Creates a PlainListView
    /// - Returns PlainListView
    func create() -> some View {
        ForEach(content.indices, id: \.self) { index in
            let textContent = (withBulletPoint ? "• \(content[index])" : content[index])
            Text(textContent)
                .font(font)
                .fontWeight(.medium)
            
            Divider()
        }
        .padding(.horizontal, 15)
    }
}
