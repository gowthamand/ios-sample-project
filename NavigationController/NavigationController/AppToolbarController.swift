//
//  AppToolbarController.swift
//  NavigationController
//
//  Created by Gowthaman on 14/04/18.
//  Copyright © 2018 CosmicMind. All rights reserved.
//

import UIKit
import Material
import Graph

class AppToolbarController: ToolbarController {
    fileprivate var menuButton: IconButton!
    fileprivate var moreButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!

    override func prepare() {
        super.prepare()
        prepareMenuButton()
        prepareStarButton()
        prepareSearchButton()
//        prepareMoreButton()
        prepareStatusBar()
        prepareToolbar()
    }
}

extension AppToolbarController {
    fileprivate func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu, tintColor: .white)
        menuButton.pulseColor = .white
    }
    
    fileprivate func prepareStarButton() {
        starButton = IconButton(image: Icon.cm.star, tintColor: .white)
        starButton.pulseColor = .white
    }
    
    fileprivate func prepareSearchButton() {
        searchButton = IconButton(image: Icon.cm.search, tintColor: .white)
        searchButton.pulseColor = .white
    }
    
    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent
        statusBar.backgroundColor = Color.blue.darken3
    }
    
    fileprivate func prepareToolbar() {
        toolbar.depthPreset = .none
        toolbar.backgroundColor = Color.blue.darken2
        
        toolbar.title = "HealthyMind"
        toolbar.titleLabel.textColor = .white
        toolbar.titleLabel.textAlignment = .left
        
        toolbar.detailLabel.textColor = .white
        toolbar.detailLabel.textAlignment = .left
        
        toolbar.leftViews = [menuButton]
        toolbar.rightViews = [starButton, searchButton]
    }
}
extension AppToolbarController {
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }

    @objc
    fileprivate func handleMoreButton() {
        navigationDrawerController?.toggleRightView()
    }
}
