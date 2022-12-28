//
//  ImageView.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import SwiftUI

/// Structure that wraps the SwiftUI Image view
struct ImageView: ComponentCreator {
    /// Main asset that will be presented by the ImageView
    let asset: Asset
    
    @ViewBuilder
    /// Creates the ImageView
    /// - Returns ImageView
    func create() -> some View {
        let imageView: Image = (asset.systemDefault ? Image(systemName: asset.path) : Image(asset.path))
        let imageColor: Color = .init(uiColor: asset.color)
        
        imageView
            .resizable()
            .foregroundColor(imageColor)
            .frame(width: asset.dimensions.width, height: asset.dimensions.height)
    }
}
