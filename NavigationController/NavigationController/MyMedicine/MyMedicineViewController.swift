//
//  MyMedicineViewController.swift
//  
//
//  Created by Gowthaman on 27/04/18.
//

import UIKit
import Material


class MyMedicineViewController: UIViewController {
    var customLabel2 : UILabel = UILabel()
    var customLabel3 : UILabel = UILabel()
    let v1 = UIView()
    
    let buttons = UIButton(type: .custom)
    
    
//    fileprivate let medicineAddRemainder = MedicineAddRemainder()
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        buttons.frame = CGRect(x: screenWidth / 2 + 130, y: screenHeight / 2 + 220, width: 50, height: 50)
        buttons.layer.cornerRadius = 0.5 * buttons.bounds.size.width
        buttons.clipsToBounds = true
        buttons.addTarget(self, action: #selector(myRemainderClick), for: .touchUpInside)
        buttons.backgroundColor = Color.cyan.lighten1
        buttons.setImage(Icon.cm.add?.crop(toWidth: 30, toHeight: 20), for: .normal)
        view.addSubview(buttons)
        
        
        
        
        view.backgroundColor = .white
        customLabel2.frame = CGRect(x: 20, y: screenHeight / 2 - 20, width: screenWidth , height: 30)
        customLabel2.textColor = UIColor.black
        customLabel2.text = "Click on the press button below to begin creating "
        customLabel3.textAlignment = NSTextAlignment.center
        self.view.addSubview(customLabel2)
        
        customLabel3.frame = CGRect(x: 0, y: screenHeight / 2 + 10 , width: screenWidth - 15, height: 30)
        customLabel3.textColor = UIColor.black
        customLabel3.text = "medicine remainders!"
        customLabel3.textAlignment = NSTextAlignment.center
        self.view.addSubview(customLabel3)
        
        //          myRemainder()
        //        myProfileButton()
        //        myPetsButton()
        prepareNavigationItem()
        
    }
}

extension MyMedicineViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Medicine Remainder"
    }
    
    //    fileprivate func myRemainder() {
    //        let button = RaisedButton(title: "Press", titleColor: .black)
    //        button.pulseColor = .cyan
    //        button.backgroundColor = Color.grey.lighten3
    //        button.borderColor = Color.green.darken1
    //        button.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
    //        button.cornerRadiusPreset = CornerRadiusPreset(rawValue: Int(4.0))!
    //        //        button.borderColor = Color.green.darken1
    //        view.layout(button).width(50).height(50)
    //        view.layout(button).bottomRight(bottom: 20, right: 20)
    //        button.addTarget(self, action: #selector(myRemainderClick), for: .touchUpInside)
    //        self.view.addSubview(button)
    //        }
    @objc
    func myRemainderClick() {
        print("Add Remainder")
//        navigationController?.pushViewController(medicineAddRemainder, animated: true)
    }
    
    
}
