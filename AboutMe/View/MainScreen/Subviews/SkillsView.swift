//
//  SkillsView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Skills subview presented by the ModalView
struct SkillsView: View {
    /// Object used to control the View
    @State internal var viewModel = SkillsViewModel()
    
    var body: some View {
        ForEach(0..<5) { row in
            let label: String = viewModel.getSkillsTitle(of: row)
            
            Text(label)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .padding(.leading, 15)

            if row <= 3 {
                if let items = viewModel.getSkillsItems(of: row) {
                    HorizontalCarouselView(items: items) { tappedSkillIndex in
                        // - MARK: TODO Implementation
                        
                    }
                }
            }else {
                ComponentCreator.create(plainListContent: viewModel.softSkills, withBulletPoint: true)
            }
        }
    }
}
