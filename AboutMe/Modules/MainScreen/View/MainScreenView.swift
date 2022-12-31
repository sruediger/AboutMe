//
//  ContentView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 26/04/22.
//

import SwiftUI

/// Main view that shows the app's main interface
internal struct MainScreenView: View {
    /// Device current color scheme
    @Environment(\.colorScheme) var colorScheme
    /// Object used to control the View
    @StateObject var viewModel: MainScreenViewModel
    
    public init(viewModel: MainScreenViewModel = MainScreenViewModel()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        UINavigationBar.appearance().standardAppearance = viewModel.navigationBarAppearence
    }

    var body: some View {
        self.createContentView()
            .navigationViewStyle(.stack)
            .blur(radius: viewModel.popupWindowBlurRadius)
            .overlay { PopupView(subview: $viewModel.presentedSubview) }
            .ignoresSafeArea()
    }
}

#if DEBUG
struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
            .previewInterfaceOrientation(.portrait)
    }
}
#endif
