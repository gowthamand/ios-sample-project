//
//  DonateViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 27/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//
import UIKit
import Material
import Alamofire

class DonateViewController: UIViewController {
    
    fileprivate var card: Card!
    fileprivate var toolbar: Toolbar!
    fileprivate var contentView: UILabel!
    
    fileprivate var card1: Card!
    fileprivate var toolbar1: Toolbar!
    fileprivate var contentView1: UILabel!
    
    fileprivate var card2: Card!
    fileprivate var toolbar2: Toolbar!
    fileprivate var contentView2: UILabel!
    
    fileprivate var card3: Card!
    fileprivate var toolbar3: Toolbar!
    fileprivate var contentView3: UILabel!
    
    
    
    var imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
    var imageView1 = UIImageView(frame: CGRect(x: 10, y: 140, width: 100, height: 100))
    var imageView2 = UIImageView(frame: CGRect(x: 10, y: 270, width: 100, height: 100))
    var imageView3 = UIImageView(frame: CGRect(x: 10, y: 400, width: 100, height: 100))
    var image = UIImage(named: "doc.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        topNavi()
        imageView.image = image
        imageView1.image = image
        imageView2.image = image
        imageView3.image = image
        self.view.addSubview(imageView)
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        
        prepareToolbar()
        prepareContentView()
        prepareCard()
        
        prepareToolbar1()
        prepareContentView1()
        prepareCard1()
        
        prepareToolbar2()
        prepareContentView2()
        prepareCard2()
        
        prepareToolbar3()
        prepareContentView3()
        prepareCard3()
        
    }
    
}

extension DonateViewController {
    func topNavi() {
        navigationItem.titleLabel.text = "Donate"
    }
    
    
    fileprivate func prepareToolbar() {
        toolbar = Toolbar(rightViews: nil)
        
        toolbar.title = "Ram"
        toolbar.titleLabel.textAlignment = .left
        
        toolbar.detail = "Build Beautiful Software"
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.grey.base
    }
    fileprivate func prepareToolbar1() {
        toolbar1 = Toolbar(rightViews: nil)
        
        toolbar1.title = "Ram"
        toolbar1.titleLabel.textAlignment = .left
        
        toolbar1.detail = "Build Beautiful Software"
        toolbar1.detailLabel.textAlignment = .left
        toolbar1.detailLabel.textColor = Color.grey.base
    }
    
    fileprivate func prepareToolbar2() {
        toolbar2 = Toolbar(rightViews: nil)
        
        toolbar2.title = "Ram"
        toolbar2.titleLabel.textAlignment = .left
        
        toolbar2.detail = "Build Beautiful Software"
        toolbar2.detailLabel.textAlignment = .left
        toolbar2.detailLabel.textColor = Color.grey.base
    }
    fileprivate func prepareToolbar3() {
        toolbar3 = Toolbar(rightViews: nil)
        
        toolbar3.title = "Ram"
        toolbar3.titleLabel.textAlignment = .left
        
        toolbar3.detail = "Build Beautiful Software"
        toolbar3.detailLabel.textAlignment = .left
        toolbar3.detailLabel.textColor = Color.grey.base
    }
    
    fileprivate func prepareContentView() {
        contentView = UILabel()
        contentView.numberOfLines = 0
        
        contentView.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        contentView.font = RobotoFont.regular(with: 14)
        //      contentView.font = RobotoFont.light(with: 14)
    }
    fileprivate func prepareContentView1() {
        contentView1 = UILabel()
        contentView1.numberOfLines = 0
        
        contentView1.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        contentView1.font = RobotoFont.regular(with: 14)
        //      contentView.font = RobotoFont.light(with: 14)
    }
    fileprivate func prepareContentView2() {
        contentView2 = UILabel()
        contentView2.numberOfLines = 0
        
        contentView2.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        contentView2.font = RobotoFont.regular(with: 14)
        //      contentView.font = RobotoFont.light(with: 14)
    }
    fileprivate func prepareContentView3() {
        contentView3 = UILabel()
        contentView3.numberOfLines = 0
        
        contentView3.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        contentView3.font = RobotoFont.regular(with: 14)
        //      contentView.font = RobotoFont.light(with: 14)
    }
    fileprivate func prepareCard() {
        card = Card()
        
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .square3
        card.toolbarEdgeInsets.bottom = 0
        card.toolbarEdgeInsets.right = 8
        
        card.contentView = contentView
        card.contentViewEdgeInsetsPreset = .wideRectangle3
        
        view.layout(card).horizontally(left: 120, right: 20).top(10)
        //        view.layout(card).horizontally(imageView, left: 10, right: 20).top(10)
        
    }
    
    fileprivate func prepareCard1() {
        card1 = Card()
        
        card1.toolbar = toolbar1
        card1.toolbarEdgeInsetsPreset = .square3
        card1.toolbarEdgeInsets.bottom = 0
        card1.toolbarEdgeInsets.right = 8
        
        card1.contentView = contentView1
        card1.contentViewEdgeInsetsPreset = .wideRectangle3
        
        view.layout(card1).horizontally(left: 120, right: 20).top(140)
        //        view.layout(card).horizontally(imageView, left: 10, right: 20).top(10)
        
    }
    
    fileprivate func prepareCard2() {
        card2 = Card()
        
        card2.toolbar = toolbar2
        card2.toolbarEdgeInsetsPreset = .square3
        card2.toolbarEdgeInsets.bottom = 0
        card2.toolbarEdgeInsets.right = 8
        
        card2.contentView = contentView2
        card2.contentViewEdgeInsetsPreset = .wideRectangle3
        
        view.layout(card2).horizontally(left: 120, right: 20).top(270)
        //        view.layout(card).horizontally(imageView, left: 10, right: 20).top(10)
        
    }
    
    fileprivate func prepareCard3() {
        card3 = Card()
        
        card3.toolbar = toolbar3
        card3.toolbarEdgeInsetsPreset = .square3
        card3.toolbarEdgeInsets.bottom = 0
        card3.toolbarEdgeInsets.right = 8
        
        card3.contentView = contentView3
        card3.contentViewEdgeInsetsPreset = .wideRectangle3
        
        view.layout(card3).horizontally(left: 120, right: 20).top(400)
        //        view.layout(card).horizontally(imageView, left: 10, right: 20).top(10)
        
    }
    
}
