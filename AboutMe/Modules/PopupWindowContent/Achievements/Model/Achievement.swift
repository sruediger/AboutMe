//
//  Achievement.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 22/12/22.
//

/// Enumaration that defines Sérgio's current achievements model
internal enum Achievement: InteractiveItem {
    case wwdcSwiftStudentChallenge(year: UInt16)
    case entrepreneurCamp(app: Application)
}
