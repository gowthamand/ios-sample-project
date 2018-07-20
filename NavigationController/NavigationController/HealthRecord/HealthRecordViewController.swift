//
//  HealthRecordViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 16/04/18.
//  Copyright © 2018 Entityvibes. All rights reserved.
import UIKit
import Material

class HealthRecordViewController: UIViewController {
    
    let v1 = UIView()
    fileprivate let myHealRecViewController = MyHealRecViewController()
    fileprivate let myFamiHelRecViewController = MyFamiHelRecViewController()
    fileprivate let myPetHealRecViewController = MyPetHealRecViewController()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        myFamilyButton()
        myProfileButton()
        myPetsButton()
        topNavigationItem()
        
    }
}

extension HealthRecordViewController {
    func topNavigationItem() {
        navigationItem.titleLabel.text = "Health Record"
    }
    fileprivate func myFamilyButton() {
        let button = RaisedButton(title: "My Health Record", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(1.0))!
        button.borderColor = Color.green.darken1
        view.layout(button).width(250).height(150).left(75).top(40)
        button.addTarget(self, action: #selector(myHealRecButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
        
        //        view.layout(button).width(ButtonLayout.Raised.width).height(ButtonLayout.Raised.height).center(offsetY:ButtonLayout.Raised.offsetY)
        //            .center().bottom(250)
    }
    fileprivate func myProfileButton() {
        let button = RaisedButton(title: "My Family Health Record", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(1.0))!
        let scrHeight: CGFloat = screenHeight / 3
        button.borderColor = Color.green.darken1
        view.layout(button).width(251).height(150).left(75).top(CGFloat(scrHeight))
        button.addTarget(self, action: #selector(myFamiRecButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
        //        view.layout(button)
        //            .width(ButtonLayout.Raised.width).height(ButtonLayout.Raised.height).center().top(30)
        //        //            .center(offsetY: ButtonLayout.Raised.offsetY)
    }
    fileprivate func myPetsButton() {
        let button = RaisedButton(title: "My Pet Health Record", titleColor: .black)
        button.pulseColor = .cyan
        button.backgroundColor = Color.grey.lighten3
        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(1.0))!
        let scrHeight: CGFloat = screenHeight / 3
        button.borderColor = Color.green.darken1
        view.layout(button).width(250).height(150).left(75).top(CGFloat(scrHeight+scrHeight-40))
        button.addTarget(self, action: #selector(myPetRecButtonClick), for: .touchUpInside)
        self.view.addSubview(button)
        //        view.layout(button).width(ButtonLayout.Raised.width).height(ButtonLayout.Raised.height).center().bottom(30)
        //        //            .center(offsetY: ButtonLayout.Raised.offsetY)
    }
}
fileprivate extension HealthRecordViewController {
    @objc
    func myHealRecButtonClick() {
        print("My Health Record ")
        navigationController?.pushViewController(myHealRecViewController, animated: true)
    }
    @objc
    func myFamiRecButtonClick() {
        print("My Family Health Record")
        navigationController?.pushViewController(myFamiHelRecViewController, animated: true)
    }
    @objc
    func myPetRecButtonClick() {
        print("My Pet Health Record ")
        navigationController?.pushViewController(myPetHealRecViewController, animated: true)
    }
    
}

