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
    
    private let myArray: NSArray = ["Gowthaman","Bhargava","Nagarjun","Mahendra","Pavithra","Sunitha", "Mari Muthu"]
    private let imgArray: NSArray = ["insu","doner","groceries","insu","doner","xeperevent", "folder"]
    private let detArray: NSArray = ["Life is beautiful, so reflect it.","It’s all about perspective","So much to say, so few words.","Life is beautiful, so reflect it.","It’s all about perspective","So much to say, so few words.","It’s all about perspective"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.backButton.tintColor = Color.teal.base
        
        prepareNavigationItem()
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//        cell.textLabel!.text = "\(myArray[indexPath.row])"
//        let image : UIImage = UIImage(named: "logo")!
//        cell.imageView?.image = image
//        return cell
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//
//        cell.textLabel?.text = "\(myArray[indexPath.row])"
//        let image : UIImage = UIImage(named: "\(imgArray[indexPath.row])")!
//        cell.imageView?.image = image
//        cell.detailTextLabel?.text = "\(detArray[indexPath.row])"
//        cell.detailTextLabel?.textAlignment = .right
//        cell.dividerColor = Color.grey.lighten2
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "yourCellIdentifier")
        cell.textLabel?.text = "\(myArray[indexPath.row])"
        cell.detailTextLabel?.text = "\(detArray[indexPath.row])"
        let image : UIImage = UIImage(named: "\(imgArray[indexPath.row])")!
        cell.imageView?.image = image
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
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

}






