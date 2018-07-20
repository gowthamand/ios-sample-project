//
//  NewsViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 24/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material
import Alamofire
import SwiftyJSON
import Graph
import Motion
import Foundation


//class NewsViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        prepareNavigationItem()
//        prepareNewsCategory()
//    }
//
//    func makeViewController(newsTitle: String, color: UIColor) -> UIViewController {
//        let vc = UIViewController()
//        vc.view.backgroundColor = color
//        vc.tabItem.title = newsTitle
//        return vc
//    }
//}
//extension NewsViewController {
//    func prepareNavigationItem() {
//        navigationItem.titleLabel.text = "News"
//    }
//
//    func prepareNewsCategory() {
//        let urlString = baseURL+"getAllNewsCategory?token="+tokenSucces
//
//        Alamofire.request(urlString, method: .get ,encoding: JSONEncoding.default).responseJSON {
//            response in
//            let newsResponse = response.result.value as?  [String : AnyObject]
//            let used = newsResponse!["news"] as? [[String : AnyObject]]
//            let newsCount = used!.count
//            var arrayAppend = [self.makeViewController(newsTitle: "Welcome", color: Color.amber.accent1)]
//            for index in 0..<newsCount {
//                let name = used![index]["name"] as! String
//                arrayAppend.append(self.makeViewController(newsTitle: name,color: Color.amber.accent1 ))
//            }
//            let tabsController = TabsController(viewControllers:arrayAppend )
//            tabsController.tabBarAlignment = .top
//            tabsController.tabBar.dividerAlignment = .bottom
//            tabsController.tabBar.lineHeight = 2
//            tabsController.tabBar.heightPreset = .medium
//            tabsController.tabBar.setTabItemsColor(Color.cyan.base, for: .selected)
//            tabsController.tabBar.setLineColor(Color.cyan.base, for: .selected)
//
//            self.addChildViewController(tabsController)
//            self.view.addSubview(tabsController.view)
//            self.view.layout(tabsController.view).edges(top: 0, left: 0, bottom: 0, right: 0)
//        }
//    }
//}
//class childUIView: UIViewController {
//        fileprivate func prepareDateFormatter() {
//            dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .medium
//            dateFormatter.timeStyle = .none
//        }
//
//        fileprivate func prepareDateLabel() {
//            dateLabel = UILabel()
//            dateLabel.font = RobotoFont.regular(with: 12)
//            dateLabel.textColor = Color.blueGrey.base
//            dateLabel.textAlignment = .center
//            dateLabel.text = dateFormatter.string(from: Date.distantFuture)
//        }
//
//        fileprivate func prepareFavoriteButton() {
//            favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
//        }
//
//        fileprivate func prepareShareButton() {
//            shareButton = IconButton(image: Icon.cm.share, tintColor: Color.blueGrey.base)
//        }
//
//        fileprivate func prepareMoreButton() {
//            moreButton = IconButton(image: Icon.cm.moreHorizontal, tintColor: Color.blueGrey.base)
//        }
//
//        fileprivate func prepareToolbar() {
//            toolbar = Toolbar(rightViews: [moreButton])
//            toolbar.backgroundColor = nil
//
//            toolbar.title = "Akshay"
//            toolbar.titleLabel.textColor = .black
//            toolbar.titleLabel.textAlignment = .left
//
//            toolbar.detail = "Health Aadhar ID"
//            toolbar.detailLabel.textColor = .black
//            toolbar.detailLabel.font = RobotoFont.regular
//            toolbar.detailLabel.textAlignment = .left
//        }
//
//
//        fileprivate func prepareContentView() {
//            contentView = UILabel()
//            contentView.numberOfLines = 0
//            contentView.text = "Material is an animation and graphics framework that is used to create beautiful applications."
//            contentView.font = RobotoFont.regular(with: 14)
//        }
//
//        fileprivate func prepareBottomBar() {
//            bottomBar = Bar(leftViews: [favoriteButton], rightViews: [shareButton], centerViews: [dateLabel])
//        }
//        fileprivate func preparePresenterCard() {
//            //        card = ImageCard()
//
//            card = Card()
//
//            card.toolbar = toolbar
//            card.toolbarEdgeInsetsPreset = .square3
//            card.toolbarEdgeInsets.bottom = 0
//            card.toolbarEdgeInsets.right = 8
//
//            //        card.imageView = imageView
//
//            card.contentView = contentView
//            card.contentViewEdgeInsetsPreset = .wideRectangle3
//
//            card.bottomBar = bottomBar
//            card.bottomBarEdgeInsetsPreset = .wideRectangle2
//
//            //        view.layout(card).horizontally(left: 20, right: 20).center()
//            //        view.layout(card).width(screenWidth / 2).top(39)
//            view.layout(card).horizontally(left: 20, right: 20).top(screenHeight / 4)
//
//        }
//
//        fileprivate func prepareRaisedButton() {
//            let button = RaisedButton(title: "PAY", titleColor: .white)
//            button.pulseColor = .white
//            button.backgroundColor = Color.green.base
//            //        view.layout(button).bottom(10)
//            view.layout(button)
//                .width(screenWidth / 2)
//                .height(40)
//                .bottom(10)
//
//            //        view.layout(button)
//            //            .width(ButtonLayout.Raised.width)
//            //            .height(ButtonLayout.Raised.height)
//            //            .center(offsetY: ButtonLayout.Raised.offsetY)
//            //            .bottom().center()
//        }
//}



class NewsViewController: UIViewController {
    let userName = "Jake"

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareNavigationItem()
        prepareTabheader()
        let userInfo = test()
        print(userInfo)
    }
    
    func makeViewController(backgroundColor: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabItem.title = "abcdef"

        return vc
    }
}
extension NewsViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "News"
    }
    func prepareTabheader(){
        
    let viewControllers = [
        makeViewController(backgroundColor: Color.purple.lighten1),
        makeViewController(backgroundColor: Color.purple.lighten2),
        makeViewController(backgroundColor: Color.purple.lighten3),
        makeViewController(backgroundColor: Color.purple.lighten4)
    ]
    let tabsController = TabsController(viewControllers: viewControllers)
    tabsController.tabBarAlignment = .top
    tabsController.tabBar.dividerAlignment = .bottom
    tabsController.tabBar.lineHeight = 2
    tabsController.tabBar.heightPreset = .medium
    tabsController.tabBar.setTabItemsColor(Color.cyan.base, for: .selected)
    tabsController.tabBar.setLineColor(Color.cyan.base, for: .selected)
    
    addChildViewController(tabsController)
    view.addSubview(tabsController.view)
    view.layout(tabsController.view).edges(top: 0, left: 0, bottom: 0, right: 0)
    }
    func test() -> String {
        
        return self.userName
    }
}
