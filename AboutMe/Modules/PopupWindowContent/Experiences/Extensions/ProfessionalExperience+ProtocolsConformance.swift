//
//  ProfessionalExperience+ProtocolsConformance.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import class UIKit.UIColor
import struct CoreGraphics.CGSize

internal extension ProfessionalExperience {
    
    /// InteractiveItem protocol conformance override
    var name: String { .localized("EITFreela") }
    
    /// CustomStringConvertible protocol conformance
    var description: String { self.shortDescription }

    /// Experience's short description
    var shortDescription: String {
        switch self {
            case .freelanceDev: return .localized("EIDFreela")
        }
    }
    
    /// Experience's duration
    var duration: String {
        switch self {
            case .freelanceDev: return "2020 - " + .localized("EIDFreelaTime")
        }
    }
    
    /// Experience's duration asset
    var durationAsset: Asset {
        return Asset(
            path: "calendar.badge.clock",
            color: UIColor(.primary),
            dimensions: self.durationIconDimensions
        )
    }
    
    /// Experience's asset
    var image: Asset {
        return Asset(
            path: "laptopcomputer.and.iphone",
            color: UIColor(.primary),
            dimensions: CGSize(width: 56, height: 46)
        )
    }
}
