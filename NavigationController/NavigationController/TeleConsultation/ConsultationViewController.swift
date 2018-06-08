//
//  ConsultationViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 26/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material

class ConsultationViewController: UIViewController {
    fileprivate let enquiryController = EnquiryViewController()
    
    let uiText = UITextView(frame: CGRect(x: 10, y: 10, width: screenWidth - 10, height: screenHeight / 2 - 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        self.automaticallyAdjustsScrollViewInsets = true
        uiText.text = "We have a range of affordable pricing plans suited to the size and needs of your organisation.To outline your requirements and get further information pricing on the Consultation Module,please contact any of the team directly. "
        uiText.textAlignment = .justified
        //        uiText.font = UIFont(name: "Roboto", size: 15)
        uiText.textColor = UIColor.black
        uiText.font = UIFont(name: (uiText.font?.fontName)!, size: 15)
        self.view.addSubview(uiText)
        prepareNavigationItem()
        Enquiry()
        
    }
    
}

extension ConsultationViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Consultation"
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
        print("Enquiry Controller")
        navigationController?.pushViewController(enquiryController, animated: true)
    }
}
