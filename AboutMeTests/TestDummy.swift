//
//  TestDummy.swift
//  AboutMeTests
//
//  Created by Sérgio Ruediger on 03/05/22.
//

import UIKit

public final class TestDummy {
    
    /// Sergio's apps URLs
    private var appsURLs: [URL?] {
        let appStoreEndpoint: String = "https://apps.apple.com/us/app/apple-store/"
        let appIDs: [String] = ["id1578548717", "id1592372877", "id1609281831", "id1586542328", "id1606237250"]
        var urls: [URL] = []
        
        appIDs.indices.forEach { index in
            urls.append(URL(string: appStoreEndpoint.appending(appIDs[index]))!)
        }

        return urls
    }
    
    /// Sergio's contacts URLs
    private var contactsURLs: [URL?] { [URL(string: "https://linkedin.com/in/sergiogruediger")!, URL(string: "https://github.com/sruediger")!, URL(string: "https://t.me/sgruediger")!] }
    
    /// All URLs used by this app
    internal var URLs: [URL?] { self.contactsURLs + self.appsURLs } // The '+' operator concatenates the operand arrays
    
    /// All assets used by this app repredented as an Array<UIImage>
    internal var assets: [UIImage?] {
        var images: [UIImage?] = []
        
        let _ = {() in // Fetch Apps
            let apps: [String] = ["FaunaVsBunny", "CatchNap", "Fonospace", "iHasher", "Secretly"]
            apps.forEach { images.append(UIImage(named: String("Apps/").appending($0))) }
        }()
        
        let _ = {() in // Fetch Contacts
            let contacts: [String] = ["github", "linkedIn", "telegram"]
            contacts.forEach { images.append(UIImage(named: String("Contacts/").appending($0))) }
        }()
        
        let _ = {() in // Fetch Programming Languages
            let contacts: [String] = ["C", "Cpp", "Haskell", "Java", "ObjectiveC", "Python", "Rust", "ShellScript", "Solidity", "Swift"]
            contacts.forEach { images.append(UIImage(named: String("Languages/").appending($0))) }
        }()
        
        let _ = {() in // Fetch Tech Skills
            let contacts: [String] = ["AppStore", "CoreData", "Figma", "Git", "Jenkins", "Linux", "MongoDB", "MySQL", "Photoshop", "Postgresql", "SQLite", "SwiftUI", "Testflight", "UIKit", "Xcode"]
            contacts.forEach { images.append(UIImage(named: String("TechSkills/").appending($0))) }
        }()
        
        let _ = {() in // Fetch Other assets (uncategorized)
            let contacts: [String] = ["memojiWWDC21"]
            contacts.forEach { images.append(UIImage(named: String("Sergio/").appending($0))) }
        }()
        
        return images
    }
    
}
