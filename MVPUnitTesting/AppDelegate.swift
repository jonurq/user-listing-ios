//
//  AppDelegate.swift
//  MVPUnitTesting
//
//  Created by Jonatan Urquiza on 5/13/20.
//  Copyright © 2020 Jonatan Urquiza. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let navigationController = UINavigationController(rootViewController: ListingInstance.viewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

