//
//  HorizontalCarouselView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 30/04/22.
//

import SwiftUI

struct HorizontalCarouselView: View {
    internal var items: [AnimatableScroll]
    internal var completionHandler: (Int) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                 ForEach(items.indices, id: \.self) { index in
                     GeometryReader { geometry in
                         Button(action: {
                             HapticsManager.trigger(.medium)
                             completionHandler(index)
                         }) {
                             VStack(alignment: .center, spacing: 10) {
                                 self.createItem(at: index)
                                     .rotation3DEffect(Angle(degrees: Double((geometry.frame(in: .global).minX - 20) / -20)), axis: (x: 0, y: 1, z: 0), anchor: .center, anchorZ: 0.0, perspective: 1/*2.25*/)
                                 self.createLabel(String("\(items[index].description)"))
                             }
                         }
                     }.frame(width: 112, height: 112)
                 }
             }.padding(.leading, 15).padding(.trailing, 15)
         }
    }
    
    @ViewBuilder private func createItem(at index: Int) -> some View {
        let image: Image = Image(items[index].imagePath).resizable()
        
        if let _ = items as? [Applications] {
            image.cornerRadius(18)
                .scaledToFit()
        }else {
            image
                .frame(width: 64, height: 64)
                .scaledToFill()
            /*
            BlurredRectangleView(style: .systemChromeMaterial, foregroundColor: .black.opacity(0.15), cornerRadius: 20, shadowRadius: 0)
                .overlay(image.frame(width: 64, height: 64))*/
        }
    }
    
    @ViewBuilder private func createLabel(_ text: String) -> some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
            .font(.system(.subheadline, design: .rounded))
    }
}

/*
struct HorizontalCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCarouselView(items: TechSkills.allItems)
            .preferredColorScheme(.dark)
    }
}
*/
