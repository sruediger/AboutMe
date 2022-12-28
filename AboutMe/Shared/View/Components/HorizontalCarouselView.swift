//
//  HorizontalCarouselView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import SwiftUI

/// SwiftUI's custom HScrollView wrapper that creates an animated horizontal carousel view
struct HorizontalCarouselView: ComponentCreator, ScreenProperties {
    @Orientation private var orientation
    /// Collection of the items that will be presented
    internal var items: [AnimatableScroll]
    /// Action that happens when an item is tapped
    internal var completionHandler: (Int) -> Void
    
    init(items: [AnimatableScroll], completionHandler: @escaping (Int) -> Void) {
        self.items = items
        self.completionHandler = completionHandler
    }
    
    /// Computed property that checks when the y-axis rotation should be disabled (zeroed)
    private var yAxisRotation: CGFloat { orientation == .portrait && self.currentDevice != .pad ? 1 : 0 }
            
    @ViewBuilder
    /// Creates a HorizontalCarouselView instance
    /// - Returns HorizontalCarouselView ContentView
    func create() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(items.indices, id: \.self) { index in
                    GeometryReader { geometry in
                        Button(action: {
                            HapticsManager.trigger(.medium)
                            completionHandler(index)
                        }) {
                            VStack(alignment: .center, spacing: 10) {
                                self.createItemIcon(for: index)
                                    .rotation3DEffect(
                                        Angle(degrees: Double((geometry.frame(in: .global).minX - 20) / -20)),
                                        axis: (x: 0, y: yAxisRotation, z: 0),
                                        anchor: .center,
                                        anchorZ: 0.0,
                                        perspective: 1/*2.25*/
                                    )
                                    
                                self.createLabel(String("\(items[index].description)"))
                            }
                        }
                        .disabled(!items[index].isInteractive)
                    }.frame(width: 112, height: 112)
                }
            }.padding(.leading, 15).padding(.trailing, 15)
        }
    }
}

/// HorizontalCarouselView+PrivateBuilders
private extension HorizontalCarouselView {
    
    @ViewBuilder
    /// Creates an icon for a specified item index
    /// - Parameter index: Item's index
    /// - Returns HCItemIconView
    func createItemIcon(for index: Int) -> some View {
        let image: Image = Image(items[index].image.path).resizable()
        
        if items is [Application] {
            image
                .cornerRadius(18)
                .scaledToFit()
        } else {
            image
                .frame(width: 64, height: 64)
                .scaledToFill()
        }
    }
    
    @ViewBuilder
    /// Creates an item label
    /// - Parameter text: The label content
    /// - Returns HCItemLabelView
    func createLabel(_ text: String) -> some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
            .font(.system(.subheadline, design: .rounded))
    }
}
