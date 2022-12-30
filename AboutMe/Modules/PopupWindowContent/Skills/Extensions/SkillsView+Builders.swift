//
//  SkillsView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

internal extension SkillsView {
    
    @ViewBuilder
    /// Creates Sérgio's skills rows
    /// - Returns SkillsRowsView
    func createSkillsRows() -> some View {
        ForEach(self.rowsAmount, id: \.hashValue) {
            let rowTitle: String = viewModel.getSkillsTitle(of: $0)
            self.createCategoryTextView(named: rowTitle)
            
            if $0 <= self.lastComposedItemIndex {
                self.createComposedItems(forRow: $0)
            }else { self.createBulletPointItems() }
        }
    }
}

/// SkillsView+PrivateBuilders
private extension SkillsView {
    
    @ViewBuilder
    /// Creates category text views
    /// - Parameter title: Name of the category
    /// - Returns SkillsRowsView
    func createCategoryTextView(named title: String) -> some View {
        Text(title)
            .font(.system(.title2, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .padding(.leading, self.textLeadingPadding)
    }
    
    @ViewBuilder
    /// Creates an HorizontalCarouselView
    /// - Parameter index: Row's index
    /// - Returns HorizontalCarouselView
    func createComposedItems(forRow index: Int) -> some View {
        let items = viewModel.getSkillsItems(of: index)
        HorizontalCarouselView(items: items) { _ = $0 }
    }
    
    @ViewBuilder
    /// Creates a default PlainListView
    /// - Returns PlainListView
    func createBulletPointItems() -> some View {
        PlainListView(content: viewModel.softSkills)
    }
}
