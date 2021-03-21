//
//  AppDelegate.swift
//  Instagram_MVVM
//
//  Created by NGUYENLONGTIEN on 2/26/21.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        //window?.rootViewController = MainTabController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabController()
        window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        //
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle


}

