import UIKit
import Material

class LeftViewController: UIViewController {
    fileprivate var transitionButton: FlatButton!
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.teal.lighten2
        
        homeButton()
        profileButton()
        healthRecord()
        healthAadhar()
        logOut()
    }
}

extension LeftViewController {
    
    fileprivate func homeButton() {
        transitionButton = FlatButton(title: "Home", titleColor: .black)
        transitionButton.pulseColor = .white
        transitionButton.backgroundColor = Color.grey.lighten3
        transitionButton.addTarget(self, action: #selector(homeTransitionButton), for: .touchUpInside)
        view.layout(transitionButton).horizontally().top(135)
    }
    
    fileprivate func profileButton() {
        transitionButton = FlatButton(title: "Profile", titleColor: .black)
        transitionButton.pulseColor = .white
        transitionButton.backgroundColor = Color.grey.lighten3
        transitionButton.addTarget(self, action: #selector(handleTransitionButton), for: .touchUpInside)
        view.layout(transitionButton).horizontally().top(170)
    }
    
    fileprivate func healthRecord() {
        transitionButton = FlatButton(title: "Health Record", titleColor: .black)
        transitionButton.pulseColor = .white
        transitionButton.backgroundColor = Color.grey.lighten3
        transitionButton.addTarget(self, action: #selector(healthRecordTransitionButton), for: .touchUpInside)
        view.layout(transitionButton).horizontally().top(205)
    }
    
    fileprivate func healthAadhar() {
        transitionButton = FlatButton(title: "Health Aadhar", titleColor: .black)
        transitionButton.pulseColor = .white
        transitionButton.backgroundColor = Color.grey.lighten3
        transitionButton.addTarget(self, action: #selector(handleTransitionButton), for: .touchUpInside)
        view.layout(transitionButton).horizontally().top(240)
    }
    fileprivate func logOut() {
        transitionButton = FlatButton(title: "Log Out", titleColor: .black)
        transitionButton.borderColor = Color.grey.darken4
        transitionButton.pulseColor = .white
        transitionButton.backgroundColor = Color.grey.lighten3
        transitionButton.addTarget(self, action: #selector(logOutClick), for: .touchUpInside)
        view.layout(transitionButton).horizontally().top(275)
    }
}

extension LeftViewController {
    @objc fileprivate func homeTransitionButton() {
        print("Home")
        navigationDrawerController?.closeLeftView()
        (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(DashboardViewController(), animated: true)
    }
    @objc fileprivate func handleTransitionButton() {
        print("Profile")
        navigationDrawerController?.closeLeftView()
        (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(ProfileViewController(), animated: true)
    }
    @objc fileprivate func healthRecordTransitionButton() {
        print("Profile")
        navigationDrawerController?.closeLeftView()
        (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(HealthRecordViewController(), animated: true)
    }
    
    @objc fileprivate func logOutClick() {
        print("logOutClick")
        navigationDrawerController?.closeLeftView()
        (navigationDrawerController?.rootViewController as? NavigationController)?.pushViewController(ViewController(), animated: true)
    }

    fileprivate func closeNavigationDrawer(result: Bool) {
        navigationDrawerController?.closeLeftView()
    }
}

