//
//  MyProfileViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 16/04/18.
//  Copyright © 2018 EntityVibes. All rights reserved.
//

import UIKit
import Material
import Motion


class MyProfileViewController: UIViewController {
    fileprivate var buttons = [TabItem]()
    fileprivate var tabBar: TabBar!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        prepareNavigationItem()
        prepareButtons()
        prepareTabBar()
    }
}

extension MyProfileViewController {
    
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "My Profile"
    }
    
    fileprivate func prepareButtons() {
        let btn1 = TabItem(title: "BASIC DETAILS", titleColor: Color.blueGrey.base)
        btn1.pulseAnimation = .none
        buttons.append(btn1)
        
        let btn2 = TabItem(title: "ADVANCED DETAILS", titleColor: Color.blueGrey.base)
        btn2.pulseAnimation = .none
        buttons.append(btn2)
        
    }
    
    fileprivate func prepareTabBar() {
        tabBar = TabBar()
        tabBar.delegate = self
        tabBar.dividerColor = Color.grey.lighten2
        tabBar.dividerAlignment = .bottom
        
        tabBar.lineColor = Color.cyan.base
        tabBar.lineAlignment = .bottom
        
        tabBar.backgroundColor = Color.grey.lighten5
        tabBar.tabItems = buttons
        
        view.layout(tabBar).horizontally().top()
    }
}

extension MyProfileViewController: TabBarDelegate {
    @objc
    func tabBar(tabBar: TabBar, willSelect tabItem: TabItem) {
        print("will select")
    }
    
    @objc
    func tabBar(tabBar: TabBar, didSelect tabItem: TabItem) {
        print("did select")
    }
}
