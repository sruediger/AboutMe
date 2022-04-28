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
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label()
                        Spacer()
                        Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                            .foregroundColor(.gray)
                      //      .foregroundColor(colorScheme == .dark ? .black : .white)
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut, value: collapsed)
            .transition(.slide)
        }
    }
}
