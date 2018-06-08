
//  Created by Gowthaman on 12/04/18.
//  Copyright © 2018 Gowthaman All rights reserved.

import UIKit
import Material
import Graph
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    func applicationDidFinishLaunching(_ application: UIApplication) {
//        window = UIWindow(frame: Screen.bounds)
//        window!.rootViewController = AppNavigationController(rootViewController: ViewController())
//
//        window!.makeKeyAndVisible()
//    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let rootViewController = ViewController()
        let appNavigationController = AppNavigationController(rootViewController: rootViewController)
        let leftViewController = LeftViewController()
        let appNavDrawerController = AppNavigationDrawerController(rootViewController: appNavigationController, leftViewController: leftViewController)
        window = UIWindow(frame: Screen.bounds)
        window!.rootViewController = appNavDrawerController
        window!.makeKeyAndVisible()
    }
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
//    func applicationDidFinishLaunching(_ application: UIApplication) {
//        SampleData.createSampleData()
//
//        let graph = Graph()
//        let search = Search<Entity>(graph: graph).for(types: "Category")
//
//        var viewControllers = [PostsViewController]()
//
//        for category in search.sync() {
//            if let name = category["name"] as? String {
//                viewControllers.append(PostsViewController(category: name))
//            }
//        }
//
//        let tabsController = AppTabsController(viewControllers: viewControllers)
//        let toolbarController = AppToolbarController(rootViewController: tabsController)
//
//        window = UIWindow(frame: Screen.bounds)
//        window!.rootViewController = toolbarController
//        window!.makeKeyAndVisible()
//    }
 
}

