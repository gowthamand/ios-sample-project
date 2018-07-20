//
//  SearchViewController.swift
//  NavigationController
//
//  Created by Vera on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class SearchViewController: UIViewController, UISearchBarDelegate {
    let tabBarct = UITabBarController()
    let searchBar: UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
//        func searchBar(searchBar: UISearchBar, textDidChange textSearched: String)
//        {
//
//        }

        
        navi()
        
        createTabBar()

    }

}
extension SearchViewController {
    fileprivate func navi() {
        navigationItem.titleLabel.text = "Search"
        
    }
    

    fileprivate func createTabBar(){

        tabBarct.tabBar.tintColor = UIColor.cyan

        let hospitalVC = UIViewController()
        hospitalVC.title = "HOSPITAL"


        hospitalVC.view.backgroundColor = UIColor.green

        let pharmacyVC = UIViewController()
        pharmacyVC.title = "PHARMACY"
        pharmacyVC.view.backgroundColor = UIColor.cyan

        let controllerArray = [hospitalVC,pharmacyVC]
        tabBarct.viewControllers = controllerArray.map{ UINavigationController.init(rootViewController: $0)}

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font : UIFont(name: "Roboto", size: 16) as Any], for: .normal)
       tabBarct.tabBar.frame = CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50)
        self.view.addSubview(tabBarct.view)
    }
}

//CGRect frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.tabBar.bounds.size.height + 15);
//[self.tabBar setFrame:frame];

//let rect = self.tabBar.frame;
//self.tabBar.frame  = rect.insetBy(dx: 0, dy:  -view.frame.height + self.tabBar.frame.height + (self.navigationController?.navigationBar.frame.height)!)

































