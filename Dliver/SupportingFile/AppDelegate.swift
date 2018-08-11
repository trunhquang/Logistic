//
//  AppDelegate.swift
//  Dliver
//
//  Created by N&M on 6/30/18.
//  Copyright © 2018 N&M. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    var rootNavigationController: UINavigationController?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // set navigation color
        UINavigationBar.appearance().barTintColor = AppColors.MainColor
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        IQKeyboardManager.sharedManager().enable = true
        setRootView()
        return true
    }
}
//MARK: - Private method
extension AppDelegate {
    private func setRootView(){
        window = UIWindow(frame: Screen.BOUNDS)
        Util.showLoginFlow()
        window!.makeKeyAndVisible()
    }
}
