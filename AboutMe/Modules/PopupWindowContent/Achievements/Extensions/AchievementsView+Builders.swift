//
//  AchievementsView+Builders.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

internal extension AchievementsView {
    
    @ViewBuilder
    /// Creates the AchievementsRowView
    /// - Returns AchievementsRowView
    func createAchievementsRowsView() -> some View {
        ForEach(self.achievements) { achievement in
            VStack(alignment: .leading, spacing: .zero) {
                self.createAchievementView(achievement)
                self.createItemDivider(achievement == achievements.last)
            }
        }
    }
    
    // - MARK: AchievementsScreen protocol conformance
    
    /// Computed property that calculates the achievement's background height scale factor
    var achievementBackgroundHeightScaleFactor: CGFloat {
        let ratio: (portrait: CGFloat, landscape: CGFloat)
        
        if self.currentDevice == .pad {
            ratio = (0.07, 0.12)
        } else { ratio = (0.1, 0.15) }
        
        return self.screenDimensions.height * (orientation.isLandscape ? ratio.landscape : ratio.portrait)
    }
}

// - MARK: Private Builders

/// AchievementsView+PrivateBuilders
private extension AchievementsView {
    
    @ViewBuilder
    /// Creates an item divider
    /// - Returns ItemDivider
    func createItemDivider(_ lastItem: Bool) -> some View {
        if !lastItem {
            Divider()
                .padding(.vertical, self.defaultPadding)
        }
    }
    
    @ViewBuilder
    /// Creates an AchievementView
    /// - Parameter achievement: Achievement to populate it's view
    /// - Returns AchievementView
    func createAchievementView(_ achievement: Achievement) -> some View {
        VStack(alignment: .leading, spacing: defaultSpacing) {
            self.createAchievementButton(achievement)

            Text(achievement.description)
                .font(.system(self.contentFont, design: .rounded))
                .fontWeight(.medium)
        }
        .padding(.horizontal, self.defaultPadding)
        .multilineTextAlignment(.leading)
    }
    
    @ViewBuilder
    /// Creates an AchievementButton
    /// - Parameter achievement: Button's data source
    /// - Returns AchievementButtonView
    func createAchievementButton(_ achievement: Achievement) -> some View {
        Button(action: { self.update(subject: .init(achievement.url)) }) {
            ZStack {
                BlurredRectangleView(
                    style: .prominent,
                    foregroundColor: .clear,
                    shadowRadius: self.achievementBackgroundShadowRadius
                )
                .opacity(self.achievementBackgroundOpacity)
                .frame(height: self.achievementBackgroundHeightScaleFactor)
                
                HStack(spacing: self.defaultSpacing) {
                    ImageView(asset: achievement.image)
                        .scaleEffect(achievement.image.scaleRatio)
                    
                    Text(achievement.name)
                        .font(.system(self.titleFont, design: .rounded))
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .padding(.top, self.halfDefaultPadding)
                        .minimumScaleFactor(self.achievementTextMinimumScaleFactor)
                }
                .padding(.horizontal, self.defaultPadding * 2)
            }
        }
        .buttonStyle(.plain)
    }
}
