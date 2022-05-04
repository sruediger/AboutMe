//
//  ModalView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 01/05/22.
//

import SwiftUI

struct ModalView: View {
    @Binding var subview: MainScreenSubview?
    @State internal var viewModel = ModalViewModel()
        
    var body: some View {
        if let subviewContent = subview {
            ZStack {
                ComponentCreator.create(backgroundWithColor: .black.opacity(0.45))
                    .onTapGesture { /// Dismiss the presented modal when the background is tapped
                        self.subview = nil
                    }
                
                let windowSize = viewModel.getSizeOf(content: subview)

                self.createModalCardView(of: subviewContent)
                    .frame(width: windowSize.width * (viewModel.deviceInPortraitMode ? 0.64 : 1), height:  windowSize.height * (viewModel.deviceInPortraitMode ? 1.48 : 1)) /// These values must be an *Source of Truth (eg: @State, @Binding, ...)* to be dynamically updated when the orientation changes, that's why isn't encapsulated in the viewModel
            }.transition(.opacity.animation(.easeOut(duration: 0.25)))
        }else { EmptyView() }
    }
}


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(subview: .constant(.skills))
    }
}
