
//  Created by Gowthaman on 12/04/18.
//  Copyright © 2018 Gowthaman All rights reserved.

import UIKit
import Material
import Alamofire
import SwiftyJSON
import UserNotifications

class ViewController: UIViewController, UITextViewDelegate {
    fileprivate var mobileField: TextField!
    fileprivate var passwordField: TextField!
    fileprivate var scroolView: UIScrollView!
    var activeField: TextField?
    
    let defaults = UserDefaults.standard
    fileprivate let dashboardController = DashboardViewController()
    fileprivate let registerController = RegisterController()

    // A constant to layout the textFields.
    fileprivate let constant: CGFloat = 32

    override func viewDidLoad() {
        super.viewDidLoad()
        let badgeCount: Int = 10
        let application = UIApplication.shared
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
        }
        application.registerForRemoteNotifications()
        application.applicationIconBadgeNumber = badgeCount

        toolbarController?.toolbar.isHidden = true
        navigationItem.backButton.isHidden = true
        navigationDrawerController?.isEnabled = false
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        view.backgroundColor = Color.grey.lighten5

        prepareLogo()
        preparePasswordField()
        prepareMobileField()
        loginSubmitButton()
        labelLink()
        sinUpLink()
        dismissKeyBoard()
    }
    

    @objc func loginButton(sender: RaisedButton!){
        showProgress()
        let mobile_number : String = mobileField.text!
        let password : String = passwordField.text!
        let params = [
            "mobile_number" : mobile_number,
            "password" : password,
            ]
        let urlString = "https://healthaadhar.com/webservice/public/authenticate"
        Alamofire.request(urlString, method: .post, parameters: params ,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            
            switch response.result {
            case .success:
                if((response.result.value) != nil) {
                    let swiftyJsonVar = JSON(response.result.value!)
                    if swiftyJsonVar["message"] == "login successfull" {
                        self.defaults.set("\(swiftyJsonVar["token"])", forKey: "token")
                        self.defaults.set("login", forKey: "success")
                        hideProgress()
                        getNewsCateory()
                        self.navigationController?.pushViewController(self.dashboardController, animated: true)
                    } else {
                        hideProgress()
                        print("Error")
                        self.alert(message: "Invalid username/password")
//                        let alert = UIAlertController(title: "Error !", message: ("Invalid Mobile Number and Password"), preferredStyle: UIAlertControllerStyle.alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
                    }
                }
                break
            case .failure(let error):
                print(error)
                let token = UserDefaults.standard.string(forKey: "token") ?? ""
                print(token)
                let alert = UIAlertController(title: "Error", message: ("\(error)"), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    /// Handle the Key responder
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func SignUpClick(sender: RaisedButton!){
        print("signUpPress")
         navigationController?.pushViewController(registerController, animated: true)
    }


}

extension ViewController {

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

    fileprivate func prepareMobileField() {
        mobileField = TextField()
        mobileField.placeholder = "Phone Number"
        mobileField.isClearIconButtonEnabled = true
        mobileField.delegate = self
        mobileField.dividerNormalColor = Color.teal.lighten1
        mobileField.placeholderActiveColor = Color.teal.lighten1
        mobileField.dividerActiveColor = Color.teal.lighten1
        mobileField.isPlaceholderUppercasedWhenEditing = false
        mobileField.delegate = self
        mobileField.text = "9025444834"
        mobileField.keyboardType = .decimalPad
        view.layout(mobileField).center(offsetY: -passwordField.bounds.height - 60).left(20).right(20)
    }

    fileprivate func preparePasswordField() {
        passwordField = TextField()
        passwordField.placeholder = "Password"
        passwordField.detail = "At least 8 characters"
        passwordField.clearButtonMode = .whileEditing
        passwordField.dividerNormalColor = Color.teal.lighten1
        passwordField.placeholderActiveColor = Color.teal.lighten1
        passwordField.dividerActiveColor = Color.teal.lighten1
        passwordField.isVisibilityIconButtonEnabled = true
        passwordField.delegate = self
        passwordField.text = "password"
        passwordField.visibilityIconButton?.tintColor = Color.teal.base.withAlphaComponent(passwordField.isSecureTextEntry ? 0.38 : 0.54)

        view.layout(passwordField).center().left(20).right(20)
    }

    fileprivate func loginSubmitButton() {
        let button = RaisedButton(title: "Login", titleColor: .white)
        button.pulseColor = .white
        button.backgroundColor = Color.teal.lighten1
        view.layout(button).center(offsetY: -passwordField.bounds.height + 180).left(20).right(20)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButton), for: .touchUpInside)
        self.view.addSubview(button)
    }

    fileprivate func labelLink(){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 30, height: 24))
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = .justified
        label.text = "Dont't have an Account ?"
        label.font = UIFont(name: "Default", size: 20)
        view.layout(label).bottom(screenHeight / 7.5).left(screenWidth/8)
        self.view.addSubview(label)
    }

    fileprivate func sinUpLink(){
        let button = FlatButton(title: "Sign Up", titleColor: .black)
        button.backgroundColor = .white

        view.layout(button).bottom(screenHeight / 8).left(colThreeByThree)
        button.addTarget(self, action: #selector(SignUpClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
}
extension ViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true
        self.view.endEditing(true)
        return true
    }

}
