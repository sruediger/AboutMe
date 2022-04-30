//
//  ProgrammingLanguagesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import SwiftUI

struct ProgrammingLanguagesView: View {
    @State private var isPresented: Bool = false 
        
    var body: some View {
        self.createLanguagesView()
    }
}

extension ProgrammingLanguagesView {
    
    // - MARK: Deprecated
    @ViewBuilder private func oldImplementationView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.0862745098, green: 0.1019607843, blue: 0.1450980392, alpha: 1)), Color("Colors/background"), Color(#colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
         //       .opacity(0.25)
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.isPresented = false
                            }) {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                            }
                        }
                        self.createLanguagesView()
                           // .offset(x: .zero, y: -5)
                    }
                )//.foregroundColor(.secondary)
        }.frame(/*width: UIScreen.main.bounds.width, */height: UIScreen.main.bounds.height * 0.215)
    }
    
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
