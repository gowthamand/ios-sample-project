//
//  HealthProgramsViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 24/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material
import Graph
import Motion
import SwiftyJSON
import Alamofire


class HealthProgramsViewController: UIViewController {
    var bannerView: UIImageView!
    fileprivate let subscriptionViewController = SubscriptionViewController()
    fileprivate let cardViewViewController = CardViewViewController()
    fileprivate let profileViewController = ProfileViewController()
    fileprivate let donateViewController = DonateViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        prepareNavigationItem()
        
        let viewControllers = [
            makeViewController(backgroundColor: "TAB 1", images : "pattern", uiviewcontroller:subscriptionViewController ),
            makeViewController(backgroundColor: "TAB 2", images : "telemedi", uiviewcontroller:cardViewViewController),
            makeViewController(backgroundColor: "TAB 3", images : "doner", uiviewcontroller:profileViewController),
            makeViewController(backgroundColor: "TAB 4", images : "my_health", uiviewcontroller:donateViewController)
        ]
        
        let tabsController = TabsController(viewControllers: viewControllers)
        tabsController.tabBarAlignment = .top
        tabsController.tabBar.dividerAlignment = .bottom
        tabsController.tabBar.lineHeight = 2
        tabsController.tabBar.heightPreset = .medium
        tabsController.tabBar.setTabItemsColor(Color.teal.base, for: .selected)
        tabsController.tabBar.setLineColor(Color.teal.base, for: .selected)
        
        addChildViewController(tabsController)
        view.addSubview(tabsController.view)
        view.layout(tabsController.view).edges(top: 0, left: 0, bottom: 0, right: 0)
        
        
    }
    
    func makeViewController(backgroundColor: String, images: String, uiviewcontroller: UIViewController) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        vc.tabItem.title = backgroundColor

        vc.addChildViewController(CardViewViewController())
        
        
//        bannerView = UIImageView(frame: CGRect(x: 100, y: 150, width: 100, height: 100))
//        bannerView.image = UIImage(named: images)
//        bannerView.backgroundColor = UIColor.gray
//
//        view.layout(bannerView).center().left(20).right(20)


//        let v1 = UIView()
//
//        v1.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        v1.motionIdentifier = "v1"
//        v1.backgroundColor = Color.grey.lighten2
//        v1.borderColor = Color.teal.base
//        v1.borderWidthPreset = BorderWidthPreset(rawValue: Int(2.0))!
//        v1.shadowColors = Color.grey.lighten5
        
        
        vc.view.addSubview(uiviewcontroller.view)
        return vc
    }
}
extension HealthProgramsViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Health Programs"
    }
}



