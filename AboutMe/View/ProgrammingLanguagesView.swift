//
//  ProgrammingLanguagesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import SwiftUI

struct ProgrammingLanguagesView: View {
        
    var body: some View {
        self.createLanguagesView()
    }
}

extension ProgrammingLanguagesView {
    
    
    @ViewBuilder private func createLanguagesView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
             LazyHStack(spacing: 20) {
                 ForEach(ProgrammingLanguages.allCases) { language in
                     GeometryReader { geometry in
                         Rectangle()
                             .background(.ultraThinMaterial)
                             .foregroundColor(.black.opacity(0.15))
                             .foregroundStyle(.ultraThinMaterial)
                             .cornerRadius(20)
                    
                         //    .fill(LinearGradient(gradient: Gradient(colors: [.primary, .secondary]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        //         .opacity(0.28)
                             .overlay(
                                 VStack(alignment: .center, spacing: 10) {
                                     Image(language.imagePath)
                                         .resizable()
                                         .frame(width: 64, height: 64)
                                     
                                     Text("\(language.description)")
                                         .font(.system(.subheadline, design: .rounded))
                                 }.foregroundColor(.white)
                             ).rotation3DEffect(Angle(degrees: Double((geometry.frame(in: .global).minX - 20) / -20)),
                             axis: (x: 0, y: 1, z: 0),
                             anchor: .center,
                             anchorZ: 0.0,
                             perspective: 2.25
                         )
                     }.frame(width: 128)
                 }
             }.frame(height: 128)
         }
    }
    
}

struct ProgrammingLanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingLanguagesView()
            .preferredColorScheme(.dark)
            
    }
}
