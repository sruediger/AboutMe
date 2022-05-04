//
//  ExperiencesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

struct ExperiencesView: View {
    
    var body: some View { /// Time complexity: O(nˆ2)
        ForEach(0..<2, id: \.self) { section in
            let sectionTitle: String = (section == 0 ? "Education" : "Professional")
            
            Text(sectionTitle)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            let sectionItems: [ExperienceItem] = (section == 0 ? ExperienceItem.getSergioEducation() : ExperienceItem.getSergioExperiences())
            
            ForEach(sectionItems) { item in
                HStack(spacing: 8) {
                    let iconWidth: CGFloat = item.imagePath.contains("laptop") ? 56 : 42
                    
                    ComponentCreator.create(imageFromPath: item.imagePath, dimensions: CGSize(width: iconWidth, height: 46), system: true, customColor: .primary)
                        .padding(2)
                    
                    let smallPhone = UIScreen.main.bounds.height <= 667
                    
                    VStack(alignment: .leading, spacing: smallPhone ? 2 : 1.25) {
                        let titleFont: Font.TextStyle = smallPhone ? .subheadline : .title3
                        let contentFont: Font = smallPhone ? .footnote : .subheadline
                        
                        Text(item.name)
                            .font(.system(titleFont, design: .rounded))
                            .fontWeight(.semibold)
                        
                        Text(item.shortDescription)
                            .font(contentFont)
                            .fontWeight(.medium)
                        
                        HStack(spacing: 5) {
                            let timeImagePath: String = (section == 0 ? "graduationcap.fill" : "calendar.badge.clock")
                            
                            ComponentCreator.create(imageFromPath: timeImagePath, dimensions: CGSize(width: 18, height: 18), system: true, customColor: .primary)
                            
                            Text(item.duration)
                                .font(contentFont)
                                .fontWeight(.medium)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
    
}
