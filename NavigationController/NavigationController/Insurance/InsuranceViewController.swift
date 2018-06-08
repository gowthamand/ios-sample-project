//
//  InsuranceViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class InsuranceViewController: UIViewController {
    fileprivate let addInsuranceController = AddInsuranceViewController()
    
    let buttons = UIButton(type: .custom)
    
    var customSeg = UISegmentedControl (items: ["Yes","No"])
    var customlabel : UILabel = UILabel()
    var customLabel2 : UILabel = UILabel()
    var customLabel3 : UILabel = UILabel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        buttons.frame = CGRect(x: screenWidth / 2 + 130, y: screenHeight / 2 + 220, width: 50, height: 50)
        buttons.layer.cornerRadius = 0.5 * buttons.bounds.size.width
        buttons.clipsToBounds = true
        buttons.addTarget(self, action: #selector(insuranceClick), for: .touchUpInside)
        buttons.backgroundColor = Color.cyan.lighten1
        buttons.setImage(Icon.cm.add?.crop(toWidth: 30, toHeight: 20), for: .normal)
        view.addSubview(buttons)
        
        customSeg.frame = CGRect(x: 10, y: 60, width: screenWidth - 15, height: 30)
        customSeg.selectedSegmentIndex = 1
        customSeg.tintColor = UIColor.blue
        //        customSegmentedControl.addTarget(self, action: "segmentedValueChanged:", forControlEvents: .ValueChanged)
        self.view.addSubview(customSeg)
        prepareNavigationItem()
        
        customlabel.frame = CGRect(x: 10, y: 30, width: screenWidth - 15, height: 30)
        customlabel.textColor = UIColor.black
        customlabel.text = "Insurance"
        self.view.addSubview(customlabel)
        
        customLabel2.frame = CGRect(x: 20, y: screenHeight / 2 - 10, width: screenWidth - 15, height: 30)
        customLabel2.textColor = UIColor.black
        customLabel2.text = "Click on the press button below to add your"
        customLabel3.textAlignment = NSTextAlignment.center
        self.view.addSubview(customLabel2)
        
        customLabel3.frame = CGRect(x: 0, y: screenHeight / 2 + 10 , width: screenWidth - 15, height: 30)
        customLabel3.textColor = UIColor.black
        customLabel3.text = "Insurance!"
        customLabel3.textAlignment = NSTextAlignment.center
        self.view.addSubview(customLabel3)
        
        //        insurance()
        
        
    }
}
extension InsuranceViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Insurance"
    }
    //    fileprivate func insurance() {
    //        let button = RaisedButton(title: "Press", titleColor: .white)
    //        button.pulseColor = .white
    //        button.backgroundColor = Color.cyan.base
    //        button.borderColor = Color.green.darken1
    //        button.frame = CGRect(x: 100, y: 100, width: 160, height: 160)
    //
    //        button.layer.shadowOffset = CGSize(width: 10, height: 10)
    //        button.layer.masksToBounds = false
    //        button.layer.shadowOpacity = 0.1
    //        button.layer.cornerRadius = button.frame.width / 6
    //        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
    //        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
    //        //        button.borderColor = Color.green.darken1
    //        view.layout(button).width(60).height(60).bottomRight(bottom: 10, right: 10)
    //        button.addTarget(self, action: #selector(insuranceClick), for: .touchUpInside)
    //        self.view.addSubview(button)
    //}
    @objc
    func insuranceClick() {
        print("Add Insurance")
        navigationController?.pushViewController(addInsuranceController, animated: true)
    }
    
}


