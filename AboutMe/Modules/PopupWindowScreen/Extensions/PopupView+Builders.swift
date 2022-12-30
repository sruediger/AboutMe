//
//  PopupView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

extension PopupView: ViewFactory {
    
    @ViewBuilder
    /// Creates the main ContentView
    /// - Returns PopupWindow's ContentView
    internal func createContentView() -> some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(self.backgroundOpacity)
                .onTapGesture { self.subview = nil } // Dismiss the presented modal when the background is tapped
            
            let windowSize = viewModel.getSizeOf(content: subview, deviceInLandscape: orientation.isLandscape, for: self.screenDimensions)
            
            self.createPopupWindowView()
                .frame(width: windowSize.width, height:  windowSize.height)
                .transition(
                    .asymmetric(
                        insertion: .identity,
                        removal: .opacity
                    )
                    .combined(with: .scale)
                    .animation(.easeInOut)
                )
        }
    }
}

/// PopupView+ViewBuilders
private extension PopupView {
    
    /// Fetches the selected subview scroll axis
    var selectedSubviewScrollAxis: Axis.Set {
        let horizontalScroll: Bool = !self.viewModel.getVScrollIndicator(from: self.subview)
        return horizontalScroll ? [] : .vertical
    }
    
    @ViewBuilder
    /// Creates a PopupWindowView
    /// - Returns PopupWindowView<MainScreenSubview>
    func createPopupWindowView() -> some View {
        if let subview {
            BlurredRectangleView(
                style: .systemChromeMaterial,
                foregroundColor: self.backgroundForegroundColor,
                cornerRadius: self.defaultCornerRadius,
                shadowRadius: self.backgroundShadowRadius
            ).overlay {
                VStack {
                    self.createWindowHeaderView(for: subview)
                    self.createWindowContentView()
                }
            }
        }
    }
    
    @ViewBuilder
    /// Creates a PopupWindowView's Header
    /// - Parameter chosenSubview: Selected MainScreenSubview instance
    /// - Returns PopupWindowViewHeader
    func createWindowHeaderView(for chosenSubview: MainScreenSubview) -> some View {
        HStack {
            Text(chosenSubview.name)
                .foregroundColor(.primary)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                defer { self.subview = nil }
                HapticsManager.trigger(.heavy)
            } label: {
                Image(systemName: self.closeButton.path)
                    .resizable()
                    .foregroundColor(.secondary)
                    .frame(width: self.closeButton.dimensions.width, height: self.closeButton.dimensions.height)
            }
            .buttonStyle(.plain)
            .padding(self.closeButtonPadding)
            .accessibilityIdentifier("closeButton")
        }
        .padding(.bottom, self.windowHeaderBottomPadding)
        .padding([.top, .horizontal], self.defaultPadding)
        .background(.clear)
    }
    
    @ViewBuilder
    /// Creates the PopupWindowView's content view
    /// - Returns PopupWindowContentView
    func createWindowContentView() -> some View {
        GeometryReader { geometry in
            ScrollView(self.selectedSubviewScrollAxis, showsIndicators: viewModel.getVScrollIndicator(from: self.subview)) {
                VStack(alignment: .leading, spacing: self.defaultSpacing) {
                    switch self.subview {
                        case .skills: SkillsView()
                        case .experience: ExperiencesView()
                        case .apps: AppsView()
                        case .contact: ContactsView()
                        case .achievements: AchievementsView()
                        case .languages: ProgrammingLanguagesView()
                        case .none: EmptyView()
                    }
                }
                .padding(.bottom, self.windowContentBottomPadding)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }.cornerRadius(self.defaultCornerRadius)
        }.sheet(isPresented: $viewModel.webView.show) {
            WebView(url: viewModel.webView.contentURL)
        }
    }    
}
