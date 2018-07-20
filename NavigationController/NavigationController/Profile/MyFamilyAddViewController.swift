//
//  MyFamilyAddViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class MyFamilyAddViewController: UIViewController {
    fileprivate var relationship : TextField!
    fileprivate var firstname : TextField!
    
    fileprivate var lastName : TextField!
    fileprivate var contact : TextField!
    fileprivate var email : TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        prepareNavigationItem()
        relationShips()
        firstNames()
        lastNames()
        contacts()
        emails()
        addMembers() 
    }
    
}
extension MyFamilyAddViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Add Member"
    }
    fileprivate func relationShips() {
        relationship = TextField()
        relationship.placeholder = "Relationship"
        relationship.clearButtonMode = .whileEditing
        relationship.dividerNormalColor = Color.cyan.base
        relationship.placeholderActiveColor = Color.cyan.base
        relationship.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(relationship).top(30).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func firstNames() {
        firstname = TextField()
        firstname.placeholder = "Firstname"
        //        passwordField.detail = "At least 8 characters"
        firstname.clearButtonMode = .whileEditing
        firstname.dividerNormalColor = Color.cyan.base
        firstname.placeholderActiveColor = Color.cyan.base
        firstname.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(firstname).top(100).left(20).right(20)
    }
    fileprivate func lastNames() {
        lastName = TextField()
        lastName.placeholder = "Last Name"
        //        passwordField.detail = "At least 8 characters"
        lastName.clearButtonMode = .whileEditing
        lastName.dividerNormalColor = Color.cyan.base
        lastName.placeholderActiveColor = Color.cyan.base
        lastName.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(lastName).top(170).left(20).right(20)
    }
    fileprivate func contacts() {
        contact = TextField()
        contact.placeholder = "Contacts"
        //        passwordField.detail = "At least 8 characters"
        contact.clearButtonMode = .whileEditing
        contact.dividerNormalColor = Color.cyan.base
        contact.placeholderActiveColor = Color.cyan.base
        contact.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(contact).top(240).left(20).right(20)
    }
    fileprivate func emails() {
        email = TextField()
        email.placeholder = "Emails"
        //        passwordField.detail = "At least 8 characters"
        email.clearButtonMode = .whileEditing
        email.dividerNormalColor = Color.cyan.base
        email.placeholderActiveColor = Color.cyan.base
        email.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(email).top(300).left(20).right(20)
    }
    fileprivate func addMembers() {
        let button = RaisedButton(title: "ADD MEMBER", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.cyan.base
        view.layout(button).center(offsetY: -email.bounds.height + 180).left(20).right(20)
        //        view.layout(button).width(screenWidth - 20).right(20).bottom(20)
        //        view.layout(button).bottomRight(bottom: 20, right: 20)
        //        view.layout(button).bottom().center(offsetX: 10, offsetY: -uiText.bounds.height + 100)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight - 80).left(20).right(20)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight + 180).left(20).right(20)
        
        button.setTitle("ADD MEMBER", for: .normal)
        //        button.addTarget(self, action: #selector(consultation1), for: .touchUpInside)
        self.view.addSubview(button)
    }
}
