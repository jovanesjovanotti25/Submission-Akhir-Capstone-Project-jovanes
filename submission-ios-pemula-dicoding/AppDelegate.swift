//
//  AppDelegate.swift
//  submission-ios-pemula-dicoding
//
//  Created by Jovanes Jovanotti on 21/09/22.
//

import UIKit
import CoreData
import FavoriteGame
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var realm: Realm!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        realm = try! Realm()

        let navigationController = UINavigationController(rootViewController: ModuleBuilder.getView(module: .splashScreen))
        
        navigationController.navigationBar.barTintColor = UIColor.white
        navigationController.navigationBar.tintColor = UIColor.gray
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
