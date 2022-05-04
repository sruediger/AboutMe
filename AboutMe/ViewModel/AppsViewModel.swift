//
//  AppsViewModel.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 04/05/22.
//

import Foundation

struct AppsViewModel {

    internal func getItems(of row: Int) -> [AnimatableScroll] {
        return row == 0 ? Applications.authorial : Applications.collabs
    }
    
    internal func getLabel(of row: Int) -> String {
        return row == 0 ? "Made by me" : "Collabs"
    }
}
