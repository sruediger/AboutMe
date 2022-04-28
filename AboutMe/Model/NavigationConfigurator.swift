//
//  NavigationConfigurator.swift
//  AboutMe
//
//  Created by Sérgio Ruediger on 27/04/22.
//

import SwiftUI

/// Structure used to configurate the UINavigationController used internally by SwiftUI's NavigationView without the need to do this globally via the *.appearence()* method
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let navigationController = uiViewController.navigationController {
            self.configure(navigationController)
        }
    }
}
