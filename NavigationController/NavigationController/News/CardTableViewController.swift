//
//  CardTableViewController.swift
//  NavigationController
//
//  Created by Gowthaman D on 03/05/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Graph

public class CardTableViewController:UIViewController {

    public override func viewDidLoad() {
        
        prepareNavigationItem()
        view.backgroundColor = .black
        SampleData.createSampleData()
        let graph = Graph()
        let search = Search<Entity>(graph: graph).for(types: "Category")

        var viewControllers = [PostsViewController]()

        for category in search.sync() {
            if let name = category["name"] as? String {
                viewControllers.append(PostsViewController(category: name))
            }
        }

        let pageTabBarController = AppTabsController(viewControllers: viewControllers)
        let toolbarController = AppToolbarController(rootViewController: pageTabBarController)
        toolbarController.toolbar.isHidden = true

        addChildViewController(toolbarController)
        view.addSubview(toolbarController.view)
        toolbarController.view.translatesAutoresizingMaskIntoConstraints = false
        toolbarController.view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        toolbarController.view.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        toolbarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolbarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
extension CardTableViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "News"
    }
}
