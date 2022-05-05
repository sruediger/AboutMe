//
//  AppsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Apps subview presented by the ModalView
struct AppsView: View {
    /// CompletionHandler alias
    typealias Callback = (WebViewRepresentable) -> Void
    /// Action that happens when an item (app) is tapped
    let completionHandler: Callback
    /// Object used to control the View
    @State private var viewModel = AppsViewModel()
    
    var body: some View {
        ForEach(0..<2) { row in
            let items: [AnimatableScroll] = viewModel.getItems(of: row)
            let label: String = viewModel.getLabel(of: row)
            
            Text(label)
                .font(.system(.title3, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.primary.opacity(0.6))
                .padding(.leading, 15)
            
            HorizontalCarouselView(items: items) { tappedAppIndex in
                guard let tappedItem = items[tappedAppIndex] as? WebViewRepresentable else { return }
                completionHandler(tappedItem)
            }
        }
    }
}

