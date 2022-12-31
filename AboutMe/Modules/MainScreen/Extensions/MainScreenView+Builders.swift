//
//  MainScreenView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// MainScreenView+BuildersBridge
internal extension MainScreenView {
    
    @ViewBuilder
    /// Creates the main card view with inner items
    /// - Returns CardItemsView
    func createCardItemsView() -> some View {
        ZStack {
            self.createCardBackgroundView()
            VStack(alignment: .leading, spacing: self.defaultSpacing) {
                self.createHeaderView()
                                        
                Divider()
                    .padding(.vertical)
                
                ForEach(self.rowsAmount, id: \.hashValue) {
                    self.createItemsRow(of: viewModel.getSubviews(fromIndex: $0))
                        .frame(height: self.maxRowHeight)
                }
            }.padding(self.halfDefaultPadding)
        }
    }
}

// - MARK: ComponentBuilders

/// MainScreenView+ComponentBuilders
private extension MainScreenView {
    
    @ViewBuilder
    /// Creates the main screen card's background view
    /// - Returns CardBackgroundView
    func createCardBackgroundView() -> some View {
        self.createChromeBlurredRectangleView(color: self.backgroundColor)
            .overlay { self.createLinearGradient(startPoint: .bottomTrailing, endPoint: .topLeading) }
    }
    
    @ViewBuilder
    /// Creates a BlurredRectangleView with the default system chrome style
    /// - Parameters
    ///     - Parameter color: BlurredRectangleView's foregroundColor
    ///     - Parameter shadowRadius: BlurredRectangleView's shadowRadius
    /// - Returns BlurredRectangleView
    func createChromeBlurredRectangleView(color: Color, shadowRadius: CGFloat = 0) -> some View {
        BlurredRectangleView(
            style: .systemChromeMaterial,
            foregroundColor: color,
            cornerRadius: self.defaultCornerRadius,
            shadowRadius: shadowRadius
        )
    }
    
    @ViewBuilder
    /// Creates a LinearGradient
    /// - Parameters
    ///     - Parameter startPoint: LinearGradient's initial UnitPoint
    ///     - Parameter endPoint: LinearGradient's initial UnitPoint
    ///     - Parameter colors: Colors that will compose the gradient
    /// - Returns LinearGradient
    func createLinearGradient(startPoint: UnitPoint, endPoint: UnitPoint, colors: [Color] = [.accentColor, .purple]) -> some View {
        LinearGradient(
            colors: colors,
            startPoint: startPoint,
            endPoint: endPoint
        )
        .cornerRadius(self.defaultCornerRadius)
        .opacity(self.backgroundOpacity.mainCard)
    }
}

// - MARK: ViewBuilders

/// MainScreenView+ViewBuilders
private extension MainScreenView {
    
    @ViewBuilder
    /// Creates the CardItemsView's header
    /// - Returns CardItemsViewHeader
    func createHeaderView() -> some View {
        Group {
            HStack(spacing: self.defaultSpacing) {
                ImageView(asset: self.memojiAsset)
                    .cornerRadius(self.defaultCornerRadius)
                
                VStack(alignment: .leading, spacing: self.halfDefaultSpacing) {
                    Text("Sérgio Gomes Ruediger")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .lineLimit(1)
                    
                    Text(String.localized("STXOccupation"))
                        .italic()
                        .font(.subheadline)
                    
                    HStack(spacing: self.halfDefaultSpacing) {
                        ImageView(asset: self.locationAsset)
                        
                        Text(String.localized("STXLocation"))
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
                .minimumScaleFactor(0.8)
            }

            Text(String.localized("STXDescription"))
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .lineLimit(8)
                .minimumScaleFactor(0.86)
                .padding(.horizontal, halfDefaultPadding / 2)
        }.foregroundColor(.primary)
            
    }
    
    @ViewBuilder
    /// Creates a row of subview buttons (items)
    /// - Parameter subviews: Subviews that compose the items row
    /// - Returns SubviewItemsRow
    func createItemsRow(of subviews: [MainScreenSubview]) -> some View {
        HStack(spacing: self.defaultSpacing) {
            ForEach(subviews) { subview in
                Button(action: { viewModel.set(subview: subview) }) {
                    VStack(spacing: self.halfDefaultSpacing) {
                        self.createChromeBlurredRectangleView(
                            color: self.itemBackgroundColor,
                            shadowRadius: subview.image.shadowRadius
                        )
                        .opacity(self.backgroundOpacity.item)
                        .overlay { self.createItemView(for: subview) }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    /// Creates a single item view
    /// - Parameter subview: Item's data source
    /// - Returns SubviewItemView
    func createItemView(for subview: MainScreenSubview) -> some View {
        ZStack {
            self.createLinearGradient(startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(spacing: self.defaultSpacing) {
                ImageView(asset: subview.image)

                Text(subview.id)
                    .fontWeight(.semibold)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.primary)
                    .opacity(self.subviewItemForegroundOpacity)
            }
        }
    }
}
