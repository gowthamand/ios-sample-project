//
//  APIViewController.swift
//  NavigationController
//
//  Created by Gowthaman D on 07/06/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit

public func getNewsCateory() {
    let urlString = baseURL+"getAllNewsCategory?token="+token
    let url = URL(string: urlString)
    let defaults = UserDefaults.standard
    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
            let news = json["news"] as? [[String: Any]] ?? []
            defaults.set(news, forKey: "news")
        } catch let error as NSError {
            print(error)
        }
    }).resume()
}
