//
//  CuriositiesView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import SwiftUI

struct CuriositiesView: View {
    var body: some View {
        ComponentCreator.create(plainListContent: ["I have been studying programming since my adolescence and have learned most of the programming languages I know outside of university, some even before. ", "I made the initial version of the Secret.ly app all by myself in less than a month and a half.", "When I was a teenager I've worked in a hardware store with technical assistance and support, besides having spent some time doing freelance graphic design jobs. "], withBulletPoint: true, customFont: .subheadline)
            .multilineTextAlignment(.leading)
    }
}
