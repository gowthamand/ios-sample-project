//
//  EnquiryViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 26/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class EnquiryViewController: UIViewController {
    fileprivate var emailField: ErrorTextField!
    let PLACEHOLDER_TEXT = "Enquiry Description"
    
    /// A constant to layout the textFields.
    fileprivate let constant: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        prepareNavigationItem()
        prepareTitle()
        prepareEmailField()
        prepareCancelButton()
        prepareSubmitButton()
        
    }
    
    
}

extension EnquiryViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Enquiry"
    }
    func prepareTitle(){
        let nameTextfield: UITextField? = UITextField(frame:
            CGRect(x: 20, y: 20, width: self.view.frame.size.width - 40, height:self.view.frame.size.height / 2 - 270))
        nameTextfield?.placeholder = PLACEHOLDER_TEXT
        self.view.addSubview(nameTextfield!)
        
        
        let nameT = UITextView(frame: CGRect(x: 20, y: 80, width: self.view.frame.size.width - 40, height: self.view.frame.size.height / 2 - 60))
        self.view.addSubview(nameT)
    }
    fileprivate func prepareEmailField() {
        emailField = ErrorTextField()
        emailField.placeholder = "Enquiry Title"
        emailField.detail = "Error, incorrect email"
        emailField.isClearIconButtonEnabled = true
        emailField.delegate = self
        emailField.isPlaceholderUppercasedWhenEditing = true
        emailField.placeholderAnimation = .hidden
        
        // Set the colors for the emailField, different from the defaults.
        emailField.placeholderNormalColor = Color.grey.lighten1
        emailField.placeholderActiveColor = Color.pink.base
        emailField.dividerNormalColor = Color.cyan.base
        emailField.dividerActiveColor = Color.green.base
        // Set the text inset
        emailField.textInset = 20
        
        //        let leftView = UIImageView()
        //        leftView.image = Icon.cm.audio
        //        emailField.leftView = leftView
        
        //        view.layout(emailField).center(offsetY: -passwordField.bounds.height / 2 - (screenHeight / 2 - 90)).left(20).right(20)
        view.layout(emailField).top(20).width(screenWidth - 10)
        self.view.addSubview(emailField)
    }
    
    fileprivate func prepareCancelButton() {
        let button = RaisedButton(title: "Cancel", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.cyan.base
        
        view.layout(button).bottomLeft(bottom: screenHeight / 2 - 130, left: 10).width(screenWidth / 2 - 20)
        //        (bottom: screenHeight / 2 - 130).width(screenWidth / 2 - 20)
        //            .width(ButtonLayout.Raised.width)
        //            .height(ButtonLayout.Raised.height)
        //            .center(offsetY: ButtonLayout.Raised.offsetY)
    }
    fileprivate func prepareSubmitButton() {
        let button = RaisedButton(title: "Submit", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.cyan.base
        
        //        view.layout(button).bottomLeft(bottom: screenHeight / 2 - 130).width(screenWidth / 2 - 20)
        view.layout(button).bottomRight(bottom: screenHeight / 2 - 130, right: 10).width(screenWidth / 2 - 20)
        //            .width(ButtonLayout.Raised.width)
        //            .height(ButtonLayout.Raised.height)
        //            .center(offsetY: ButtonLayout.Raised.offsetY)
    }
    
    //    fileprivate func preparePasswordField() {
    //        passwordField = TextField()
    //        passwordField.placeholder = "Password"
    //        passwordField.detail = "At least 8 characters"
    //        passwordField.clearButtonMode = .whileEditing
    //        passwordField.isVisibilityIconButtonEnabled = true
    //
    //        // Setting the visibilityIconButton color.
    //        passwordField.visibilityIconButton?.tintColor = Color.green.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
    //
    //        view.layout(passwordField).center().left(20).right(20)
    //    }
}


extension EnquiryViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        return true
    }
}
