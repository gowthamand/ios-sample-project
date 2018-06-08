//
//  OtpViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 20/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON
import Material
import Foundation

class OtpViewController: UIViewController {
    
    fileprivate var otpField: ErrorTextField!
    let defaults = UserDefaults.standard
    fileprivate let dashboardViewController = DashboardViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbarController?.toolbar.isHidden = true
        navigationItem.backButton.isHidden = true
        navigationDrawerController?.isEnabled = false
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        prepareNavigationItem()
        prepareLogo()
        prepareOtpField()
        dismissKeyBoard()
        otpSubmitButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func verifyButton(sender: RaisedButton!){
        let otp_number : String = otpField.text!
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let params = [
            "otp" : otp_number,
            "token" : token,
            ]
        let urlString = baseURL+"verifyRegisterOTP?token="+token
        Alamofire.request(urlString, method: .post, parameters: params ,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                if((response.result.value) != nil) {
                    let swiftyJsonVar = JSON(response.result.value!)
                    print(swiftyJsonVar)
                    if swiftyJsonVar["message"] == "otp_verification_successful" {
                        self.defaults.set("\(swiftyJsonVar["token"])", forKey: "token")
                        self.defaults.set("otp", forKey: "success")
                        self.navigationController?.pushViewController(self.dashboardViewController, animated: true)
                    } else {
                        print("Error")
                        let alert = UIAlertController(title: "Error !", message: ("Invalid OTP"), preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                break
            case .failure(let error):
                print(error)
                let alert = UIAlertController(title: "Error", message: ("\(error)"), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

}
extension OtpViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Verify OTP"
    }
    fileprivate func dismissKeyBoard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    fileprivate func prepareLogo(){
        let imageName = "logo"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: screenWidth / 2.8, y: screenHeight / 16, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }
    fileprivate func prepareOtpField() {
        otpField = ErrorTextField()
        otpField.placeholder = "Enter OTP"
        otpField.isClearIconButtonEnabled = true
        otpField.dividerNormalColor = Color.teal.base
        otpField.placeholderActiveColor = Color.teal.base
        otpField.dividerActiveColor = Color.teal.base
        otpField.isPlaceholderUppercasedWhenEditing = false
//        otpField.delegate = self
        otpField.text = "9025444834"
        otpField.keyboardType = .decimalPad
        view.layout(otpField).center().left(20).right(20)
    }
    fileprivate func otpSubmitButton(){
        let button = RaisedButton(title: "Verify", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.teal.base
        view.layout(button).center(offsetY: -otpField.bounds.height + 180).left(20).right(20)
        button.setTitle("Verify", for: .normal)
        button.addTarget(self, action: #selector(verifyButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
}

