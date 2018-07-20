//
//  MyFamilyViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 16/04/18.
//  Copyright © 2018 EntityVibes. All rights reserved.
//

import UIKit
import Material

class MyFamilyViewController: UIViewController {
    fileprivate let myFamilyAddViewController = MyFamilyAddViewController()
    
    let buttons = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        buttons.frame = CGRect(x: screenWidth / 2 + 130, y: screenHeight / 2 + 220, width: 50, height: 50)
        buttons.layer.cornerRadius = 0.5 * buttons.bounds.size.width
        buttons.clipsToBounds = true
        buttons.addTarget(self, action: #selector(addMembers), for: .touchUpInside)
        buttons.backgroundColor = Color.cyan.lighten1
        buttons.setImage(Icon.cm.add?.crop(toWidth: 30, toHeight: 20), for: .normal)
        view.addSubview(buttons)
        
        prepareNavigationItem()
    }
    
    
}
extension MyFamilyViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "My Family"
    }
    @objc
    func addMembers() {
        print("Add Member")
        navigationController?.pushViewController(myFamilyAddViewController, animated: true)
    }
}
