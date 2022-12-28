//
//  AcademicBackground+ProtocolsConformance.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIColor
import struct CoreGraphics.CGSize

internal extension AcademicBackground {
    
    /// Experience's short description
    var shortDescription: String {
        switch self {
            case .appleDeveloperAcademy: return .localized("EIDDeveloperAcademy")
            case .university: return .localized("EIDComputerScience")
        }
    }
    
    /// Experience's duration
    var duration: String {
        switch self {
            case .appleDeveloperAcademy: return "2021 - 2022"
            case .university: return "2019 - 2023"
        }
    }
    
    /// Experience's duration asset
    var durationAsset: Asset {
        return Asset(
            path: "graduationcap.fill",
            color: UIColor(.primary),
            dimensions: self.durationIconDimensions
        )
    }
    
    /// Experience's image
    var image: Asset {
        return Asset(
            path: self.imagePath,
            color: UIColor(.primary),
            dimensions: CGSize(width: 42, height: 46)
        )
    }
    
    /// CustomStringConvertible protocol conformance
    var description: String {
        switch self {
            case .appleDeveloperAcademy: return  "Apple Developer Academy"
            case .university: return .localized("EITUCB")
        }
    }
}

private extension AcademicBackground {
    /// Experience's image path
    var imagePath: String {
        switch self {
            case .appleDeveloperAcademy: return "command"
            case .university: return "building.columns"
        }
    }
}
