//
//  ProfileViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 16/04/18.
//  Copyright © 2018 Entityvibes. All rights reserved.
//

import UIKit
import Material

struct ButtonLayout {
    struct Raised {
        static let width: CGFloat = 250
        static let height: CGFloat = 150
        static let offsetY: CGFloat = -75
    }
}


class ProfileViewController: UIViewController {
    
    let v1 = UIView()
    fileprivate let myFamilyViewController = MyFamilyViewController()
    fileprivate let myProfilVieweController = MyProfileViewController()
    fileprivate let myPetsViewController = MyPetViewController()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        topNavigationItem()
        myProfileButton()
        myFamilyButton()
        myPetsButton()
        
        
    }
}

extension ProfileViewController {
    func topNavigationItem() {
        navigationItem.titleLabel.text = "Profile"
    }
    fileprivate func myFamilyButton() {
        let button = RaisedButton(title: "My Family", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        button.borderColor = Color.green.darken1
        let scrHeight: CGFloat = screenHeight / 3
        view.layout(button).width(251).height(150).left(75).top(CGFloat(scrHeight))
        button.addTarget(self, action: #selector(myFamilyButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
//        view.layout(button).width(ButtonLayout.Raised.width).height(ButtonLayout.Raised.height).center(offsetY:ButtonLayout.Raised.offsetY)
//            .center().bottom(250)
    }
    fileprivate func myProfileButton() {
        let button = RaisedButton(title: "My Profile", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        view.layout(button).width(250).height(150).left(75).top(40)
        button.addTarget(self, action: #selector(myProfileButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
//        view.layout(button)
//            .width(ButtonLayout.Raised.width).height(ButtonLayout.Raised.height).center().top(30)
//        //            .center(offsetY: ButtonLayout.Raised.offsetY)
    }
    fileprivate func myPetsButton() {
        let button = RaisedButton(title: "My Pets", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderColor = Color.green.darken1
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
        let scrHeight: CGFloat = screenHeight / 3
        view.layout(button).width(250).height(150).left(75).top(CGFloat(scrHeight+scrHeight-40))
        button.addTarget(self, action: #selector(myPetsButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
//        view.layout(button).width(ButtonLayout.Raised.width).height(ButtonLayout.Raised.height).center().bottom(30)
//        //            .center(offsetY: ButtonLayout.Raised.offsetY)
    }
}
fileprivate extension ProfileViewController {
    @objc
    func myFamilyButtonClick() {
        print("My Family ")
        navigationController?.pushViewController(myFamilyViewController, animated: true)
    }
    @objc
    func myProfileButtonClick() {
        print("My Profile ")
        navigationController?.pushViewController(myProfilVieweController, animated: true)
    }
    @objc
    func myPetsButtonClick() {
        print("My Pets ")
        navigationController?.pushViewController(myPetsViewController   , animated: true)
    }
    
}

