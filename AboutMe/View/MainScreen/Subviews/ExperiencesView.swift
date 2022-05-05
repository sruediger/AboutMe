//
//  ExperiencesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Experiences subview presented by the ModalView
struct ExperiencesView: View {
    /// Object used to control the View
    @State private var viewModel = ExperiencesViewModel()
    
    var body: some View { /// Time complexity: O(nˆ2)
        ForEach(0..<2, id: \.self) { row in
            let sectionTitle: String = viewModel.getSection(titleAt: row)
            
            Text(sectionTitle)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            let sectionItems: [ExperienceItem] = viewModel.getSection(itemsAt: row)
            
            ForEach(sectionItems) { item in
                HStack(spacing: 8) {
                    let iconWidth: CGFloat = item.imagePath.contains("laptop") ? 56 : 42
                    
                    ComponentCreator.create(imageFromPath: item.imagePath, dimensions: CGSize(width: iconWidth, height: 46), system: true, customColor: .primary)
                        .padding(2)
                    
                    VStack(alignment: .leading, spacing: viewModel.smallPhone ? 2 : 1.25) {
                        Text(item.name)
                            .font(.system(viewModel.titleFont, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text(item.shortDescription)
                            .font(viewModel.contentFont)
                            .fontWeight(.medium)
                        
                        HStack(spacing: 5) {
                            let timeImagePath: String = viewModel.getItem(imagePathAt: row)
                            
                            ComponentCreator.create(imageFromPath: timeImagePath, dimensions: CGSize(width: 18, height: 18), system: true, customColor: .primary)
                            
                            Text(item.duration)
                                .font(viewModel.contentFont)
                                .fontWeight(.medium)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
}
