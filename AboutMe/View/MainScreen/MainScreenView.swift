//
//  ContentView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import SwiftUI

/// Main view that shows the app's main interface
struct MainScreenView: View {
    /// Object used to control the View
    @State internal var viewModel = MainScreenViewModel()
    /// Device current color scheme
    @Environment(\.colorScheme) internal var colorScheme
    
    /// Default initializer
    public init() {
        UINavigationBar.appearance().standardAppearance = viewModel.navigationBarAppearence
    }

    var body: some View {
        NavigationView {
            self.createScrollableCardView()
                .navigationTitle(Text(String.localized("STXMainTitle")))
                .navigationBarTitleDisplayMode(.automatic)
                .background(Color("Colors/background").ignoresSafeArea())
        }.navigationViewStyle(.stack)
        .blur(radius: viewModel.presentedSubview == nil ? 0 : 8)
        .overlay(ModalView(subview: $viewModel.presentedSubview))
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
       //     .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}

