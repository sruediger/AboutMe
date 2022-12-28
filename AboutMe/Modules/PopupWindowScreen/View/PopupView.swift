//
//  PopupView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 01/05/22.
//

import SwiftUI

/// Popup view that overlays the MainScreenView
internal struct PopupView: View, PopupWindow {
    /// Orientation manager
    @Orientation var orientation
    /// Subview that will be presented
    @Binding var subview: MainScreenSubview?
    /// Object used to control the View
    @StateObject var viewModel: PopupViewModel
    
    init(subview: Binding<MainScreenSubview?>, viewModel: PopupViewModel = .init()) {
        self._subview = subview
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    /// Computed property that checks if there isn't any selected subview
    fileprivate var emptySubview: Bool { self.subview == nil }

    var body: some View {
        self.createContentView()
            .opacity(emptySubview ? 0 : 1)
            .animation(.linear(duration: viewModel.animationDuration), value: !emptySubview)
    }
}

#if DEBUG
struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(subview: .constant(.achievements))
    }
}
#endif
