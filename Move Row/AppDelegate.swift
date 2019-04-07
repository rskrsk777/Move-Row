//
//  AppDelegate.swift
//  Move Row
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let myTVC = MyTableViewController()
        let navController = UINavigationController(rootViewController: myTVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
