//
//  AppDelegate.swift
//  AmazingDelegateCommandExample
//
//  Created by t.khamidov on 24.03.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window!.rootViewController = MainViewController()
        
        window!.makeKeyAndVisible()
        
        return true
    }
    
}
