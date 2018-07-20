//
//  MyFamiHelRecViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 17/04/18.
//  Copyright © 2018 Entityvibes. All rights reserved.
//

import UIKit
import Material

class MyFamiHelRecViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        // Do any additional setup after loading the view.
        prepareNavigationItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension MyFamiHelRecViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "My Family Helalth Record"
    }
}
