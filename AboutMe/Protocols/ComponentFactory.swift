//
//  ComponentFactory.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 29/04/22.
//

import SwiftUI

internal protocol ComponentFactory {
    
    
}


struct ComponentCreator: ComponentFactory {
    
    // Warning: Must be embed in a VStack
    @ViewBuilder public static func create(plainListContent contents: [String], withBulletPoint: Bool = false, customFont: Font = .body) -> some View {
        ForEach(contents.indices, id: \.self) { index in
            let textContent = (withBulletPoint ? "• \(contents[index])" : contents[index])
            Text(textContent)
                .font(customFont)
                .fontWeight(.medium)
            
            Divider()
        }.padding(.leading, 15).padding(.trailing, 15)
    }
    
    
}
