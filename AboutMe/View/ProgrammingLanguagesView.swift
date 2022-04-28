//
//  ProgrammingLanguagesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import SwiftUI

struct ProgrammingLanguagesView: View {
    
    @State private var langs: [String] = ["C", "C++", "Swift", "Python", "Java", "Shell Script", "Objective C", "Haskell", "Rust", "Solidity"]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
        
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 144, height: 144)
                .overlay(
                
                    ZStack {
                        Rectangle()
                            .foregroundColor(.purple)
                            .frame(width: 50, height: 50)
                        
                        LazyVGrid(columns: [.init(), .init()], spacing: 0) {
                            ForEach(langs.indices, id: \.self) { index in
                                Text(langs[index])
                                    .font(.footnote)
                                    .multilineTextAlignment(.center)
                                    .scaledToFit()
                                    
                            }
                        }.animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: langs)
                    }
                
                )
            
    /*    ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(ProgrammingLanguages.allCases) { language in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 28)
                            .foregroundColor(.black.opacity(0.25))
                            .overlay(
                                VStack(alignment: .center, spacing: 10) {
                                    Image(language.imagePath)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                    
                                    Text("\(language)")
                                        .font(.system(.subheadline, design: .rounded))
                                }.foregroundColor(.white)
                            ).rotation3DEffect(
                            Angle(degrees: Double((geometry.frame(in: .global).minX - 20) / -20)),
                            axis: (x: 0, y: 1, z: 0),
                            anchor: .center,
                            anchorZ: 0.0,
                            perspective: 2.25
                        )
                    }.frame(width: 128)
                }
            }.frame(height: 128)
        }*/
        }
    }
}

struct ProgrammingLanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingLanguagesView()
    }
}
