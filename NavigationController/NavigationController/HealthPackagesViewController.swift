//
//  HealthPackagesViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 17/04/18.
//  Copyright © 2018 EntityVibes.com All rights reserved.

import UIKit
import Material
import Graph
import Motion
import SwiftyJSON
import Alamofire

class HealthPackagesViewController: UIViewController {
    
    fileprivate var buttons = [TabItem]()
    fileprivate var tabBar: TabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        prepareNavigationItem()
        prepareButtons()
        prepareTabBar()
    }
    
}
extension HealthPackagesViewController {
    
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Health Packages"
    }
    
    fileprivate func prepareButtons() {
        let btn1 = TabItem(title: "Library", titleColor: Color.blueGrey.base)
        btn1.pulseAnimation = .none
        buttons.append(btn1)
        
        let btn2 = TabItem(title: "Photo", titleColor: Color.blueGrey.base)
        btn2.pulseAnimation = .none
        buttons.append(btn2)
        
        let btn3 = TabItem(title: "Video", titleColor: Color.blueGrey.base)
        btn3.pulseAnimation = .none
        buttons.append(btn3)
    }
    
    fileprivate func prepareTabBar() {
        tabBar = TabBar()
        tabBar.delegate = self
        tabBar.dividerColor = Color.grey.lighten2
        tabBar.dividerAlignment = .bottom
        
        tabBar.lineColor = Color.blue.base
        tabBar.lineAlignment = .bottom
        
        tabBar.backgroundColor = Color.grey.lighten5
        tabBar.tabItems = buttons
        
        view.layout(tabBar).horizontally().top()
    }
}

extension HealthPackagesViewController: TabBarDelegate {
    
    @objc func tabBar(tabBar: TabBar, willSelect tabItem: TabItem) {
        print(tabBar)
    }
    
    @objc func tabBar(tabBar: TabBar, didSelect tabItem: TabItem) {
        print("did select")
    }

}

