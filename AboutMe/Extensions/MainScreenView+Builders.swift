//
//  MainScreenView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

extension MainScreenView {
    
    @ViewBuilder internal func createScrollableCardView() -> some View {
        let horizontalPadding = viewModel.horizontalCardViewPadding
        ScrollView(.vertical) {
            ZStack {
                self.createCardBackgroundView()
                self.createCardItemsView()
            }.padding(EdgeInsets(top: 10, leading: horizontalPadding, bottom: 20, trailing: horizontalPadding))
        }
    }
    
    @ViewBuilder private func createCardBackgroundView() -> some View {
        BlurredRectangleView(style: .systemChromeMaterial, foregroundColor: .accentColor.opacity(0.025), cornerRadius: 20, shadowRadius: 0)
            .overlay(
                LinearGradient(colors: [.accentColor, .purple], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .cornerRadius(20)
                    .opacity(0.08)
            )
    }
    
    @ViewBuilder private func createCardItemsView() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            self.createHeaderView()
                                    
            Divider()
                .padding(.top)
                .padding(.bottom)
            
            ForEach(0..<3) { index in
                self.createBodyView(viewModel.getSubviews(fromIndex: index))
                    .frame(height: 120)
            }
        }.padding(10)
    }
    
    
    @ViewBuilder private func createHeaderView() -> some View {
        Group {
            HStack(spacing: 10) {
                ComponentCreator.create(imageFromPath: "Sergio/memojiWWDC21", dimensions: CGSize(width: 90, height: 90))
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Sérgio Gomes Ruediger")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                    
                    Text(String.localized("STXOccupation"))
                        .italic()
                        .font(.subheadline)
                   //     .fontWeight(.regular)
                    
                    HStack(spacing: 10) {
                        ComponentCreator.create(imageFromPath: "location.fill", dimensions: CGSize(width: 20, height: 20), system: true, customColor: .accentColor)
                        
                        Text(String.localized("STXLocation"))
                            .font(.system(.subheadline, design: .rounded))
                            .fontWeight(.bold)
                    }
                }
            }
          //  Divider()
            
            Text(String.localized("STXDescription"))
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            //    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }.foregroundColor(.primary)
    }
        
    @ViewBuilder private func createBodyView(_ subviews: [MainScreenSubview]) -> some View {
        HStack(spacing: 10) {
            ForEach(subviews) { subview in
                Button(action: {
                    HapticsManager.trigger(.heavy)
                    viewModel.set(subview: subview)
                }) {
                    VStack(spacing: 5) {
                        BlurredRectangleView(style: .systemChromeMaterial, foregroundColor: .secondary.opacity(colorScheme == .dark ? 0.15 : 0.55), cornerRadius: 20, shadowRadius: 6)
                            .opacity(0.45)
                            .overlay(
                                ZStack {
                                    LinearGradient(colors: [.accentColor, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .cornerRadius(20)
                                        .opacity(0.08)
                                    VStack(spacing: 10) {
                                        ComponentCreator.create(imageFromPath: subview.imagePath, dimensions: CGSize(width: 48, height: 48), system: true, customColor: .primary)
                                        Text("\(subview.id)")
                                            .fontWeight(.semibold)
                                            .font(.system(.subheadline, design: .rounded))
                                    }.foregroundColor(.primary)
                                }
                            )
                    }
                }
            }
        }
    }
}
