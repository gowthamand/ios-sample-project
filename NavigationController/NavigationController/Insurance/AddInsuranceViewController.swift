//
//  AddInsuranceViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class AddInsuranceViewController: UIViewController {
    fileprivate var insuranceName : TextField!
    fileprivate var complainField : TextField!
    
    fileprivate var typeOfInsurance : TextField!
    fileprivate var startDate : TextField!
    fileprivate var endDate : TextField!
    fileprivate var policyNumber : TextField!
    fileprivate var frequencyOfPremium : TextField!
    fileprivate var premiumAmount : TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        prepareNavigationItem()
        insuranceN()
        typeOfInsure()
        startDates()
        endDates()
        policyNumbers()
        frequency()
        premiumAmounts()
        Insurence()
    }
    
}
extension AddInsuranceViewController {
    func prepareNavigationItem(){
        navigationItem.titleLabel.text = "Add Insurance"
    }
    fileprivate func insuranceN() {
        insuranceName = TextField()
        insuranceName.placeholder = "Insurance Name"
        insuranceName.clearButtonMode = .whileEditing
        insuranceName.dividerNormalColor = Color.cyan.base
        insuranceName.placeholderActiveColor = Color.cyan.base
        insuranceName.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(insuranceName).top(30).left(20).right(20)
        //        self.view.addSubview(insuranceName)
    }
    fileprivate func typeOfInsure() {
        typeOfInsurance = TextField()
        typeOfInsurance.placeholder = "Type Of Insurance "
        //        passwordField.detail = "At least 8 characters"
        typeOfInsurance.clearButtonMode = .whileEditing
        typeOfInsurance.dividerNormalColor = Color.cyan.base
        typeOfInsurance.placeholderActiveColor = Color.cyan.base
        typeOfInsurance.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(typeOfInsurance).top(100).left(20).right(20)
    }
    fileprivate func startDates() {
        startDate = TextField()
        startDate.placeholder = "Start Date"
        //        passwordField.detail = "At least 8 characters"
        startDate.clearButtonMode = .whileEditing
        startDate.dividerNormalColor = Color.cyan.base
        startDate.placeholderActiveColor = Color.cyan.base
        startDate.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(startDate).top(170).left(20).right(20)
    }
    fileprivate func endDates() {
        endDate = TextField()
        endDate.placeholder = "End Date"
        //        passwordField.detail = "At least 8 characters"
        endDate.clearButtonMode = .whileEditing
        endDate.dividerNormalColor = Color.cyan.base
        endDate.placeholderActiveColor = Color.cyan.base
        endDate.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(endDate).top(240).left(20).right(20)
    }
    fileprivate func policyNumbers() {
        policyNumber = TextField()
        policyNumber.placeholder = "Policy Number"
        //        passwordField.detail = "At least 8 characters"
        policyNumber.clearButtonMode = .whileEditing
        policyNumber.dividerNormalColor = Color.cyan.base
        policyNumber.placeholderActiveColor = Color.cyan.base
        policyNumber.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(policyNumber).top(300).left(20).right(20)
    }
    fileprivate func frequency() {
        frequencyOfPremium = TextField()
        frequencyOfPremium.placeholder = "Frequency of Premium"
        //        passwordField.detail = "At least 8 characters"
        frequencyOfPremium.clearButtonMode = .whileEditing
        frequencyOfPremium.dividerNormalColor = Color.cyan.base
        frequencyOfPremium.placeholderActiveColor = Color.cyan.base
        frequencyOfPremium.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(frequencyOfPremium).top(370).left(20).right(20)
    }
    fileprivate func premiumAmounts() {
        premiumAmount = TextField()
        premiumAmount.placeholder = "Premium Amount"
        //        passwordField.detail = "At least 8 characters"
        premiumAmount.clearButtonMode = .whileEditing
        premiumAmount.dividerNormalColor = Color.cyan.base
        premiumAmount.placeholderActiveColor = Color.cyan.base
        premiumAmount.dividerActiveColor = Color.cyan.base
        //        complainField.isVisibilityIconButtonEnabled = true
        view.layout(premiumAmount).top(440).left(20).right(20)
    }
    
    fileprivate func Insurence() {
        let button = RaisedButton(title: "Add Insurance", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.cyan.base
        view.layout(button).bottomRight(bottom: 20, right: 20)
        //        view.layout(button).bottom().center(offsetX: 10, offsetY: -uiText.bounds.height + 100)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight - 80).left(20).right(20)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight + 180).left(20).right(20)
        
        button.setTitle("Add Insurance", for: .normal)
        //        button.addTarget(self, action: #selector(consultation1), for: .touchUpInside)
        self.view.addSubview(button)
    }
}

