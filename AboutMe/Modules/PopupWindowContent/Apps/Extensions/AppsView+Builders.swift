//
//  AppsView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

extension AppsView {
    
    @ViewBuilder
    /// Creates an row of apps made by Sérgio
    /// - Parameters
    ///     - Parameter title: Row's title
    ///     - Parameter index: Row's index
    /// - Returns AppsRowView
    internal func createAppsRowView(named title: String, at index: Int) -> some View {
        VStack(alignment: .leading, spacing: self.defaultSpacing) {
            Text(title)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(self.rowTitleForegroundColor)
                .padding(.leading, self.defaultPadding)
                .padding(.bottom, self.defaultPadding / 3)
            
            let items: [AnimatableScroll] = viewModel.getItems(of: index)
            
            self.createInteractiveAppsRowSubview(for: items)
        }
    }
    
    @ViewBuilder
    /// Creates a interactive apps row subview composed by an HorizontalCarouselView
    /// - Parameter items: Collection of items that composes the row
    /// - Returns InteractiveAppsRowSubview
    private func createInteractiveAppsRowSubview(for items: [AnimatableScroll]) -> some View {
        HorizontalCarouselView(items: items) {
            guard let tappedItem = items[$0] as? WebViewRepresentable else { return }
            completionHandler(tappedItem)
        }
    }
}
