//
//  ModalView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// ModalView+Builders
extension ModalView {
    
    @ViewBuilder internal func createModalCardView(of chosenSubview: MainScreenSubview) -> some View {
        BlurredRectangleView(style: .systemChromeMaterial, foregroundColor: .accentColor.opacity(0.02), cornerRadius: 28, shadowRadius: 4)
            .overlay(
                VStack {
                    HStack {
                        Text(chosenSubview.description)
                            .foregroundColor(.primary)
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.bold)
                        Spacer()
                        
                        /// Close Button
                        ComponentCreator.create(buttonWithDimensions: CGSize(width: 25, height: 25), imagePath: "x.circle.fill") {
                            HapticsManager.trigger(.heavy)
                            self.subview = nil
                        }
                    }.padding(EdgeInsets(top: 18, leading: 18, bottom: 1, trailing: 18))
                        .background(.clear)
                    
                    self.createContentView()
                }
            )
    }
    
    @ViewBuilder private func createContentView() -> some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: viewModel.getVScrollIndicator(from: self.subview)) {
                VStack(alignment: .leading, spacing: 10) {
                    switch self.subview {
                        case .skills: SkillsView()
                        case .languages: ProgrammingLanguagesView()
                        case .experience: ExperiencesView().padding(.leading, 12.5)
                        case .apps:
                            AppsView { tappedItem in
                                self.viewModel.tapped(webItem: tappedItem)
                            }
                        case .curiosities: CuriositiesView()
                        case .contact:
                            ContactsView { contact in
                                viewModel.tapped(webItem: contact)
                            }
                        default: EmptyView()
                    }
                }.padding(.bottom, 15)
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }.cornerRadius(28)
        }.sheet(isPresented: $viewModel.webView.show) {
            WebView(url: viewModel.webView.contentURL)
        }
    }    
}
