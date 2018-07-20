//
//  MyReportReViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class MyReportReViewController: UIViewController {
    fileprivate let enquiryController = EnquiryViewController()
    let uiText = UITextView(frame: CGRect(x: 0, y: 5, width: screenWidth - 10, height: screenHeight / 2 - 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        self.automaticallyAdjustsScrollViewInsets = true
        uiText.text = "Nutrition scientists at the Harvard T.H. Chan School of Public Health,who share that view, have developed the Healthy Eating Plate to illustrate the basic components of a healthy diet. The relative sizes of the plates sections suggest approximate proportions of each of the food groups to include in a healthy meal"
        uiText.textAlignment = .justified
        //        uiText.font = UIFont(name: "Roboto", size: 15)
        uiText.textColor = UIColor.black
        uiText.font = UIFont(name: (uiText.font?.fontName)!, size: 15)
        self.view.addSubview(uiText)
        view.backgroundColor = .white
        prepareNavigationItem()
        Enquiry()
        
    }
}

extension MyReportReViewController {
    fileprivate func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Medical Report Review"
    }
    
    fileprivate func Enquiry() {
        let button = RaisedButton(title: "Enquiry", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.cyan.base
        //        view.layout(button).bottom().center(offsetX: 10, offsetY: -uiText.bounds.height + 100)
        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight - 80).left(20).right(20)
        //        view.layout(button).center(offsetY: -uiText.bounds.height + screenHeight + 180).left(20).right(20)
        
        button.setTitle("Enquiry", for: .normal)
        button.addTarget(self, action: #selector(enquiryClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc
    func enquiryClick() {
        print("Enquiry")
        navigationController?.pushViewController(enquiryController, animated: true)
    }
    
}
