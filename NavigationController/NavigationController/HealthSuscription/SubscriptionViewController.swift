//
//  HealthAadharSubsViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 16/04/18.
//  Copyright © 2018 Entityvibes. All rights reserved.
//

import UIKit
import Material
import Graph
import Motion

class SubscriptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let myArray: NSArray = ["Gowthaman","Bhargava"]
    private let imgArray: NSArray = ["insu","doner","groceries","insu","doner","groceries","insu"]
    private let detArray: NSArray = ["Life is beautiful, so reflect it.","It’s all about perspective","So much to say, so few words.","Life is beautiful, so reflect it.","It’s all about perspective","Life is beautiful, so reflect it.","It’s all about perspective","It’s all about perspective"]
    
    let headers = ["My Self", "My Family", "My Pets"]
    private var myTableView: UITableView!
    private var paymentPay: UIButton!
    let cellId = "SubscriptionCell"
    let cellHeaderId = "cellHeaderId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        prepareNavigationItem()
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let buttonHeight = barHeight * barHeight
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
//        paymentPay = UIButton(frame: CGRect(x: 0, y: 0, width: displayWidth, height: buttonHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
//        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.section)")
////        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.myArray.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = headers[section]
        label.backgroundColor = Color.grey.lighten1
        label.textAlignment = .center
        return label
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "yourCellIdentifier")
        cell.detailTextLabel?.text = "\(detArray[indexPath.row])"
        let image : UIImage = UIImage(named: "\(imgArray[indexPath.row])")!
        cell.imageView?.image = image
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.textLabel?.text = "\(detArray[indexPath.row]) Section: \(indexPath.section) Row: \(indexPath.row)"
        return cell
    }
}
extension SubscriptionViewController {
    func prepareNavigationItem() {
        navigationItem.titleLabel.text = "Health Aadhar Subscription"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}





