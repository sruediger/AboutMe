//
//  AppsViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

/// Structure used to control the AppsView
struct AppsViewModel {

    /// Fetch the apps developed by Sérgio for Apple platforms
    /// - Parameter row: Row in which the app is presented
    /// - Returns Array<AnimatableScroll> containing the row apps
    internal func getItems(of row: Int) -> [AnimatableScroll] {
        return row == 0 ? Application.authorial : Application.collabs
    }
    
    /// Fetch the app section title label
    /// - Parameter row: Section row
    /// - Returns String containing the section title label
    internal func getLabel(of row: Int) -> String {
        return row == 0 ? String.localized("APSMadeByMe") : String.localized("APSCollabs")
    }
}
