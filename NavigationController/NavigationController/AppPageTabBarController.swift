//
//  AppPageTabBarController.swift
//  NavigationController
//
//  Created by Gowthaman D on 03/05/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

//public class AppPageTabBarController: TabsController {
//    open override func prepare() {
//        super.prepare()
//        view.backgroundColor = Color.blueGrey.lighten5
//
//        delegate = self as? TabsControllerDelegate
//        preparePageTabBar()
//    }
//}
//
//extension AppPageTabBarController {
//    fileprivate func preparePageTabBar() {
//        pageTabBarAlignment = .top
//        pageTabBar.dividerColor = nil
//        pageTabBar.lineColor = Color.blue.lighten3
//        pageTabBar.lineAlignment = .bottom
//        pageTabBar.backgroundColor = Color.blue.darken2
//    }
//}
//
//extension AppPageTabBarController: PageTabBarControllerDelegate {
//    public func pageTabBarController(pageTabBarController: PageTabBarController, didTransitionTo viewController: UIViewController) {
//        print("pageTabBarController", pageTabBarController, "didTransitionTo viewController:", viewController)
//    }
//}

class AppTabsController: TabsController {
    open override func prepare() {
        super.prepare()
        view.backgroundColor = Color.teal.lighten5
        
        preparePageTabBar()
    }
}

extension AppTabsController {
    fileprivate func preparePageTabBar() {
        tabBarAlignment = .top
        tabBar.isDividerHidden = true
        tabBar.lineAlignment = .bottom
        tabBar.setLineColor(Color.blue.lighten2, for: .selected)
        tabBar.backgroundColor = Color.teal.darken2
    }
}
