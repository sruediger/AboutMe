//
//  ExperiencesView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

internal extension ExperiencesView {
        
    @ViewBuilder
    /// Creates the default rounded ExperiencesView's text view
    /// - Parameters
    ///     - Parameter content: Text content
    ///     - Parameter font: Font's text style
    ///     - Parameter fontWeight: Content's font weight
    ///     - Parameter foregroundColor: The text color
    /// - Returns RoundedTextView
    func createRoundedTextView(_ content: String, font: Font.TextStyle, fontWeight: Font.Weight, foregroundColor: Color = .primary) -> some View {
        Text(content)
            .font(.system(font, design: .rounded))
            .fontWeight(fontWeight)
            .foregroundColor(foregroundColor)
    }
    
    @ViewBuilder
    /// Creates the experience section items view
    /// - Parameter index: Section index
    /// - Returns ExperienceSectionItemsView
    func createExperienceSectionItemsView(forRow index: Int) -> some View {
        let sectionItems: [any Experience] = viewModel.getSection(itemsAt: index)
        ForEach(sectionItems, id: \.self.hashValue) {
            self.createExperienceSectionItemView($0)
        }
    }
}

/// ExperiencesView+PrivateBuilders
private extension ExperiencesView {
    
    @ViewBuilder
    /// Creates a single experience section item view
    /// - Parameter item: View's data source
    /// - Returns ExperienceSectionItemView
    func createExperienceSectionItemView(_ item: any Experience) -> some View {
        HStack(spacing: self.defaultSpacing * 0.8) {
            ImageView(asset: item.image)
                .padding(self.paddingEdge.all)
            
            VStack(alignment: .leading, spacing: self.experienceDetailsSpacing) {
                self.createRoundedTextView(item.name, font: self.titleFont, fontWeight: .semibold)
                
                self.createRoundedTextView(item.shortDescription, font: self.contentFont, fontWeight: .medium)
                
                self.createDurationSubview(for: item)
                    .padding(.top, self.paddingEdge.top)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    /// Creates an experience item duration subview
    /// - Parameter item: View's data source
    /// - Returns DurationSubview
    func createDurationSubview(for item: any Experience) -> some View {
        HStack(spacing: self.halfDefaultSpacing) {
            ImageView(asset: item.durationAsset)
            
            Text(item.duration)
                .font(.system(self.contentFont))
                .fontWeight(.medium)
        }
    }
}
