//
//  Achievement+InteractiveItem.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

import struct SwiftUI.Color
import struct Foundation.UUID

internal extension Achievement {
    
    /// Achievement's name
    var name: String {
        switch self {
            case .wwdcSwiftStudentChallenge(let year): return "Swift Student Challenge WWDC \(year)"
            case .entrepreneurCamp(_): return "Apple Entrepreneur Camp Latinx Founders"
        }
    }
    
    /// Object's instance identifier
    var id: UUID { UUID() }
    
    /// Current achievements
    static var allCases: [Achievement] {
        let achievements: [Self] = [
            .wwdcSwiftStudentChallenge(year: 2022),
            .entrepreneurCamp(app: .pluty)
        ]
        return achievements
    }
    
    /// Achievement's image
    var image: Asset {
        return Asset(
            path: self.imagePath,
            color: .init(.primary),
            dimensions: .init(width: 48, height: 48),
            scaleRatio: 0.96
        )
    }
    
    /// Achievement's description
    var description: String {
        switch self {
            case .wwdcSwiftStudentChallenge(_): return .localized("ACHSwiftWWDCBody")
            case .entrepreneurCamp(let app): return .localized("ACHEcampBody", arguments: app.name)
        }
    }
}

private extension Achievement {
    
    /// Achievement's imagePath
    var imagePath: String {
        switch self {
            case .wwdcSwiftStudentChallenge(_): return "swift"
            case .entrepreneurCamp(_): return "suitcase.fill"
        }
    }
}
