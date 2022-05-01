//
//  CollapsibleView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import SwiftUI

struct CollapsibleView<Title: View, Content: View>: View {
    @State var label: () -> Title
    @State var content: () -> Content
    @State private var collapsed: Bool = true
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack {
            Button(action: {
                print("tapped")
                self.collapsed.toggle() }){
                HStack {
                    self.label()
                    Spacer()
                    Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                        .foregroundColor(.gray)
                  //      .foregroundColor(colorScheme == .dark ? .black : .white)
                }
                
            //    .background(Color.clear)
            }.buttonStyle(PlainButtonStyle()).padding(.bottom, 1)
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeInOut(duration: 0.25), value: collapsed)
            .transition(.opacity.animation(.easeInOut(duration: 0.1)))
        }
    }
}
