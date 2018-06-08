//
//  RegisterController.swift
//  NavigationController
//
//  Created by Gowthaman on 19/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON
import Material
import Foundation

class RegisterController: UIViewController {
    
    
    fileprivate var firstNameField:TextField!
    fileprivate var lastNameField:TextField!
    fileprivate var emailField: ErrorTextField!
    fileprivate var mobileField:TextField!
    fileprivate var passwordField: TextField!
    fileprivate let otpViewController = OtpViewController()
    let defaults = UserDefaults.standard
    
    // A constant to layout the textFields.
    fileprivate let constant: CGFloat = 32
    override func viewDidLoad() {
        navigationDrawerController?.isEnabled = false
        navigationItem.backButton.tintColor = Color.teal.base
//        let rootViewController = RegisterController()
//        let appNavigationController = AppNavigationController(rootViewController: rootViewController)
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            appDelegate.window!.rootViewController = appNavigationController
//        }
        
        super.viewDidLoad()
        view.backgroundColor = Color.grey.lighten5
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: .UIKeyboardWillChangeFrame, object: nil)
        
        prepareNavigationItem()
        prepareLogo()
        firstnameField()
        lastnamField()
        mobileNumField()
        preparePasswordField()
        prepareEmailField()
        prepareRaisedButton()
        dismissKeyBoard()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       passwordField.resignFirstResponder()
    }
    @objc func keyboardWillChange(notification: NSNotification) {
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.firstNameField.frame.origin.y+=deltaY
            self.lastNameField.frame.origin.y+=deltaY
            self.emailField.frame.origin.y+=deltaY
            self.mobileField.frame.origin.y+=deltaY
            self.passwordField.frame.origin.y+=deltaY
            
        },completion: nil)
    }
    
    @objc func loginButton(sender: RaisedButton!){
        
        let firstname : String = firstNameField.text!
        let lastname : String = lastNameField.text!
        let mobilenum : String = mobileField.text!
        let password : String = passwordField.text!
        let email : String = emailField.text!
        
        let params = [
            "first_name" : firstname,
            "last_name" : lastname,
            "mobile_number" : mobilenum,
            "password" : password,
            "email" : email,
            ]
        let urlString = baseURL+"/register"
        Alamofire.request(urlString, method: .post, parameters: params ,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                if((response.result.value) != nil) {
                    let swiftyJsonVar = JSON(response.result.value!)
                    if swiftyJsonVar["status"] == "fail" {
                        let emailEror = "\(swiftyJsonVar["token"]["email"][0])"
                        let mobileError = "\(swiftyJsonVar["token"]["mobile_number"][0])"
                        self.defaults.set("register", forKey: "success")
                        let alert = UIAlertController(title: "Error !", message: (emailEror + "\n" + mobileError), preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        print(swiftyJsonVar["token"])
                        self.defaults.set("\(swiftyJsonVar["token"])", forKey: "token")
                        self.navigationController?.pushViewController(self.otpViewController, animated: true)
                    }
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension RegisterController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Register"
    }
    fileprivate func prepareLogo(){
        let imageName = "logo"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: screenWidth / 2.8, y: screenHeight / 16, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }
    fileprivate func firstnameField(){
        firstNameField = ErrorTextField()
        firstNameField.placeholder = "First name"
        firstNameField.isClearIconButtonEnabled = true
        firstNameField.delegate = self
        firstNameField.dividerNormalColor = Color.teal.base
        firstNameField.placeholderActiveColor = Color.teal.base
        firstNameField.dividerActiveColor = Color.teal.base
        firstNameField.isPlaceholderUppercasedWhenEditing = false
        firstNameField.text = "Gowthaman"
        view.layout(firstNameField).top(210).left(20).right(20)
    }
    fileprivate func  lastnamField(){
        lastNameField = ErrorTextField()
        lastNameField.placeholder = "Last name"
        lastNameField.isClearIconButtonEnabled = true
        lastNameField.delegate = self
        lastNameField.dividerNormalColor = Color.teal.base
        lastNameField.placeholderActiveColor = Color.teal.base
        lastNameField.dividerActiveColor = Color.teal.base
        lastNameField.isPlaceholderUppercasedWhenEditing = false
        lastNameField.text = "D"
        view.layout(lastNameField).center(offsetY: -firstNameField.bounds.height + 0).left(20).right(20)
    }
    fileprivate func  mobileNumField(){
        mobileField = ErrorTextField()
        mobileField.placeholder = "Mobile Number"
        mobileField.isClearIconButtonEnabled = true
        mobileField.delegate = self
        mobileField.isPlaceholderUppercasedWhenEditing = false
        mobileField.dividerNormalColor = Color.teal.base
        mobileField.placeholderActiveColor = Color.teal.base
        mobileField.dividerActiveColor = Color.teal.base
        mobileField.keyboardType = .decimalPad
        mobileField.text = "9025444834"
        view.layout(mobileField).center(offsetY: -firstNameField.bounds.height + 60).left(20).right(20)
    }
    
    fileprivate func prepareEmailField() {
        emailField = ErrorTextField()
        emailField.placeholder = "Email"
        emailField.isClearIconButtonEnabled = true
        emailField.delegate = self
        emailField.isPlaceholderUppercasedWhenEditing = false
        emailField.keyboardType = .default
        emailField.dividerNormalColor = Color.teal.base
        emailField.placeholderActiveColor = Color.teal.base
        emailField.dividerActiveColor = Color.teal.base
        emailField.text = "gowthaman@entityvibes.com"
        view.layout(emailField).center(offsetY: -firstNameField.bounds.height + 120).left(20).right(20)
    }
    
    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Password"
        passwordField.clearButtonMode = .whileEditing
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.delegate = self
        passwordField.text = "password"
        passwordField.dividerNormalColor = Color.teal.base
        passwordField.placeholderActiveColor = Color.teal.base
        passwordField.dividerActiveColor = Color.teal.base
        passwordField.visibilityIconButton?.tintColor = Color.teal.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)
        view.layout(passwordField).center(offsetY: -firstNameField.bounds.height + 180).left(20).right(20)
    }
    fileprivate func prepareRaisedButton() {
        let button = RaisedButton(title: "Register", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.teal.base
        view.layout(button).bottom(45).left(20).right(20)
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(loginButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    fileprivate func dismissKeyBoard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
}

extension RegisterController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
//        self.view.endEditing(true)
        return true
    }
}
