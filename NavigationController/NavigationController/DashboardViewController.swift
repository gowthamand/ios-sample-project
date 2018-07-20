
//  Created by Gowthaman on 12/04/18.
//  Copyright © 2018 Gowthaman All rights reserved.

import UIKit
import Material
import Graph
import Motion
import SwiftyJSON
import Alamofire

class DashboardViewController: UIViewController {
    fileprivate let profileController = ProfileViewController()
    fileprivate let healthRecordController = HealthRecordViewController()
    fileprivate let subscriptionController = SubscriptionViewController()
    fileprivate let healthPackageController = HealthPackagesViewController()
    fileprivate let newsViewController = CardTableViewController()
    fileprivate let healthProgramsController = HealthProgramsViewController()
    fileprivate let teleConsultationController = TeleConsultationViewController()
    fileprivate let donateController = DonateViewController()
    fileprivate let insuranceController = InsuranceViewController()
    fileprivate let myMedicineController = MyMedicineViewController()
    
    
    fileprivate var menuButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    
    fileprivate var fabButton: FABButton!

    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButton.isHidden = true
        navigationDrawerController?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        view.backgroundColor = Color.grey.lighten5
 
        dashBoardComponent()
        prepareMenuButton()
        prepareBellButton()
        prepareMoreButton()
        prepareNavigationItem()
    }
}

fileprivate extension DashboardViewController {
    @objc func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu , tintColor: Color.teal.lighten2)
        menuButton.addTarget(self, action: #selector(handleMenuButton), for: .touchUpInside)
    }
    
    func prepareBellButton() {
        starButton = IconButton(image: Icon.cm.bell, tintColor: Color.teal.lighten2)
     
    }
    
    func prepareMoreButton() {
        searchButton = IconButton(image: Icon.cm.moreVertical, tintColor: Color.teal.lighten2)
    }
    
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Health Aadhar"
        
        navigationItem.leftViews = [menuButton]
        navigationItem.rightViews = [starButton, searchButton]
    }
    func dashBoardComponent(){
        var image = UIImage(named: "profile")
        let v1 = FlatButton()
        v1.backgroundColor = Color.grey.lighten3
        v1.setImage(image, for: .normal)
        v1.setImage(image, for: .highlighted)
        v1.addTarget(self, action: #selector(profilePage), for: .touchUpInside)
        self.view.addSubview(v1)
        
        image = UIImage(named: "my_health")
        let v2 = FlatButton()
        v2.backgroundColor = Color.grey.lighten3
        v2.setImage(image, for: .normal)
        v2.setImage(image, for: .highlighted)
        v2.addTarget(self, action: #selector(healthRecord), for: .touchUpInside)
        self.view.addSubview(v2)
        
//        image = UIImage(named: "aadhar")
        image = textToImage(drawText: "Health Aadhar", inImage: UIImage(named: "aadhar")! , atPoint: CGPoint(x:10,y:80))
        let v3 = FlatButton()
        v3.backgroundColor = Color.grey.lighten3
        v3.setImage(image, for: .normal)
        v3.setImage(image, for: .highlighted)
        v3.addTarget(self, action: #selector(healthSubscription), for: .touchUpInside)
        self.view.addSubview(v3)
        
//        image =
        image = textToImage(drawText: "Search", inImage: UIImage(named: "Doner100")! , atPoint: CGPoint(x:10,y:80))
        let v4 = FlatButton()
        v4.backgroundColor = Color.grey.lighten3
        v4.setImage(image, for: .normal)
        v4.setImage(image, for: .highlighted)
//        v4.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        self.view.addSubview(v4)
        
//        image = UIImage(named: "telemedi")
        image = textToImage(drawText: "TeleCommunucation", inImage: UIImage(named: "telemedi")! , atPoint: CGPoint(x:10,y:80))
        let v5 = FlatButton()
        v5.backgroundColor = Color.grey.lighten3
        v5.setImage(image, for: .normal)
        v5.setImage(image, for: .highlighted)
        v5.addTarget(self, action: #selector(teleConsultationClick), for: .touchUpInside)
        self.view.addSubview(v5)
        
        image = UIImage(named: "my_medicine")
        let v6 = FlatButton()
        v6.backgroundColor = Color.grey.lighten3
        v6.setImage(image, for: .normal)
        v6.setImage(image, for: .highlighted)
        v6.addTarget(self, action: #selector(myMedicineClick), for: .touchUpInside)
        self.view.addSubview(v6)
        
        image = UIImage(named: "health_prog")
        let v7 = FlatButton()
        v7.backgroundColor = Color.grey.lighten3
        v7.setImage(image, for: .normal)
        v7.setImage(image, for: .highlighted)
        v7.addTarget(self, action: #selector(healthProgButtonClick), for: .touchUpInside)
        self.view.addSubview(v7)
        
        image = UIImage(named: "health_package")
        let v8 = FlatButton()
        v8.backgroundColor = Color.grey.lighten3
        v8.setImage(image, for: .normal)
        v8.setImage(image, for: .highlighted)
        v8.addTarget(self, action: #selector(healthPackageButtonClick), for: .touchUpInside)
        self.view.addSubview(v8)
        
        image = UIImage(named: "news")
        let v9 = FlatButton()
        v9.backgroundColor = Color.grey.lighten3
        v9.setImage(image, for: .normal)
        v9.setImage(image, for: .highlighted)
        v9.addTarget(self, action: #selector(newsButtonClick), for: .touchUpInside)
        self.view.addSubview(v9)
        
        image = UIImage(named: "doner")
        let v10 = FlatButton()
        v10.backgroundColor = Color.grey.lighten3
        v10.setImage(image, for: .normal)
        v10.setImage(image, for: .highlighted)
        v10.addTarget(self, action: #selector(donateClick), for: .touchUpInside)
        self.view.addSubview(v10)
        
        image = UIImage(named: "insu")
        let v11 = FlatButton()
        v11.backgroundColor = Color.grey.lighten3
        v11.setImage(image, for: .normal)
        v11.setImage(image, for: .highlighted)
        v11.addTarget(self, action: #selector(insuranceClick), for: .touchUpInside)
        self.view.addSubview(v11)
        
        image = UIImage(named: "xeperevent")
        let v12 = FlatButton()
        v12.backgroundColor = Color.grey.lighten3
        v12.setImage(image, for: .normal)
        v12.setImage(image, for: .highlighted)
        v12.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        self.view.addSubview(v12)
        
        let container = View()
        container.grid.axis.direction = .any
        container.grid.axis.rows = 4
        container.grid.axis.columns = 3
        container.grid.interimSpacePreset = .interimSpace3
        
        _ = view.layout(container).left(5).right(5).top(5).height(590)
        
        v1.grid.rows = 1
        v1.grid.columns = 1
        
        v2.grid.rows = 1
        v2.grid.columns = 1
        v2.grid.offset.columns = 1
        
        v3.grid.rows = 1
        v3.grid.columns = 1
        v3.grid.offset.columns = 2
        
        v4.grid.rows = 1
        v4.grid.offset.rows = 1
        v4.grid.columns = 1
        
        v5.grid.rows = 1
        v5.grid.offset.rows = 1
        v5.grid.columns = 1
        v5.grid.offset.columns = 1
        
        v6.grid.rows = 1
        v6.grid.offset.rows = 1
        v6.grid.columns = 1
        v6.grid.offset.columns = 2
        
        v7.grid.rows = 1
        v7.grid.offset.rows = 2
        v7.grid.columns = 1
        
        v8.grid.rows = 1
        v8.grid.offset.rows = 2
        v8.grid.columns = 1
        v8.grid.offset.columns = 1
        
        v9.grid.rows = 1
        v9.grid.offset.rows = 2
        v9.grid.columns = 1
        v9.grid.offset.columns = 2
        
        v10.grid.rows = 1
        v10.grid.offset.rows = 3
        v10.grid.columns = 1
        
        v11.grid.rows = 1
        v11.grid.offset.rows = 3
        v11.grid.columns = 1
        v11.grid.offset.columns = 1
        
        v12.grid.rows = 1
        v12.grid.offset.rows = 3
        v12.grid.columns = 1
        v12.grid.offset.columns = 2

        container.grid.views = [v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12]
    }
}

fileprivate extension DashboardViewController {
    @objc
    func profilePage() {
        print("Profile Page")
        navigationController?.pushViewController(profileController, animated: true)
    }
    @objc
    func healthRecord() {
        print("Health Record Page")
        navigationController?.pushViewController(healthRecordController, animated: true)
    }
    @objc
    func healthSubscription() {
        print("Health subscription ")
        navigationController?.pushViewController(subscriptionController, animated: true)
    }
    @objc
    func handleNextButton() {
        print("Health subscription ")
        navigationController?.pushViewController(subscriptionController, animated: true)
    }
    @objc func healthPackageButtonClick() {
        print("health Packages ")
        navigationController?.pushViewController(healthPackageController, animated: true)
    }
    @objc func newsButtonClick() {
        print("News ")
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    @objc func healthProgButtonClick() {
        print("health Programs")
        navigationController?.pushViewController(healthProgramsController, animated: true)
    }
    @objc func teleConsultationClick() {
        print("Tele Consultation ")
        navigationController?.pushViewController(teleConsultationController, animated: true)
    }
    @objc func donateClick() {
        print("donate")
        navigationController?.pushViewController(donateController, animated: true)
    }
    @objc func insuranceClick() {
        print("insurance")
        navigationController?.pushViewController(insuranceController, animated: true)
    }
    @objc func myMedicineClick() {
        print("My Medicine")
        navigationController?.pushViewController(myMedicineController, animated: true)
    }
    
    
}

extension DashboardViewController {
    fileprivate func prepareToolbar() {
        guard let tc = toolbarController else {
            return
        }
        tc.toolbar.title = "Health Aadhar"
        tc.toolbar.backgroundColor = Color.teal.lighten5
    }
    @objc
    fileprivate func handleMenuButton() {
        navigationDrawerController?.toggleLeftView()
    }
    @objc
    fileprivate func handleMoreButton() {
        navigationDrawerController?.toggleRightView()
    }

}

