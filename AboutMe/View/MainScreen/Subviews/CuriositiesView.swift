//
//  CuriositiesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

/// Curiosities subview presented by the ModalView
struct CuriositiesView: View {
    var body: some View {
        ComponentCreator.create(plainListContent: [String.localized("CST1st"), String.localized("CST2nd"), String.localized("CST3rd")], withBulletPoint: true, customFont: .subheadline)
            .multilineTextAlignment(.leading)
    }
}
