//
//  SampleData.swift
//  NavigationController
//
//  Created by Gowthaman D on 03/05/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit
import Material
import Graph
import Alamofire
import SwiftyJSON
import Foundation

        
struct SampleData {
    public static func createSampleData() {
        let graph = Graph()
        graph.clear()
        
        if let arr = UserDefaults.standard.array(forKey: "news") as [AnyObject]?{
            for index in arr {
                let c1 = Entity(type: "Category")
                c1["name"] = index["name"] as! String
                
                let a1 = Entity(type: "Article")
                a1["title"] = "Anti-Stress Yoga"
                a1["detail"] = "facebook.com/healthymind.io"
//                a1["photo"] = UIImage.load(contentsOfFile: "photo6", ofType: "jpg")?.resize(toHeight: 300)
                
                let newsImage = index["image"] as! String
                let url = URL(string: "https://stageweb.healthaadhar.com/uploads/news_category/"+newsImage)
                let data = try? Data(contentsOf: url!)
                
                if let imageData = data {
                    a1["photo"] = UIImage(data: imageData)?.resize(toHeight: 300)
                }
                


                a1["content"] = "Yoga is a wonderful practice for your body and soul. It benefits you tremendously in physical and mental ways. I'd like to point out that yoga practice is mainly for your mind, rather than your body."
                
                a1.is(relationship: "Post").in(object: c1)
            }
        }
        
        
//        let a2 = Entity(type: "Article")
//        a2["title"] = "Pranayama Breath: Purify and Energize your Body and Mind with Kapalabhati"
//        a2["detail"] = "facebook.com/healthymind.io"
//        a2["photo"] = UIImage.load(contentsOfFile: "photo6", ofType: "jpg")?.resize(toHeight: 300)
//        a2["content"] = "To wake yourself up and get energized in the morning for the day ahead, you need to spend just about 5 minutes doing this wonderful breathing exercise!"
//
//        a2.is(relationship: "Post").in(object: c1)
//
//        let c2 = Entity(type: "Category")
//        c2["name"] = "Beauty"
//
//        let a3 = Entity(type: "Article")
//        a3["title"] = "Natural DIY Face Scrubs"
//        a3["detail"] = "facebook.com/healthymind.io"
//        a3["photo"] = UIImage.load(contentsOfFile: "photo7", ofType: "jpg")?.resize(toHeight: 300)
//        a3["content"] = "Exfoliation plays a significant role in keeping your skin youthful and glowing, as it removes dead skin cells from your skin's surface leaving it fresh and flawless."
//
//        a3.is(relationship: "Post").in(object: c2)
//
//        let a4 = Entity(type: "Article")
//        a4["title"] = "Natural Face Mask For Clean Youthful Skin"
//        a4["detail"] = "facebook.com/healthymind.io"
//        a4["photo"] = UIImage.load(contentsOfFile: "photo8", ofType: "jpg")?.resize(toHeight: 300)
//        a4["content"] = "The more I use natural oils and simple food for my skin and hair, the more I'm amazed with its goodness and wonderful effects! Who needs to buy cosmetics, when you can just get groceries? :)"
//
//        a4.is(relationship: "Post").in(object: c2)
//
//        let c3 = Entity(type: "Category")
//        c3["name"] = "Recipes"
//
//        let a5 = Entity(type: "Article")
//        a5["title"] = "Three Amazing Natural Teeth Whiteners"
//        a5["detail"] = "facebook.com/healthymind.io"
//        a5["photo"] = UIImage.load(contentsOfFile: "photo2", ofType: "jpg")?.resize(toHeight: 300)
//        a5["content"] = "Looking at the numerous amount of teeth whitening products on the market, which ones actually work?"
//
//        a5.is(relationship: "Post").in(object: c3)
//
//        let a6 = Entity(type: "Article")
//        a6["title"] = "Avocado Beauty Oil"
//        a6["detail"] = "facebook.com/healthymind.io"
//        a6["photo"] = UIImage.load(contentsOfFile: "photo3", ofType: "jpg")?.resize(toHeight: 300)
//        a6["content"] = "My recently developed passion for essential oils led me to another wonderful discovery- avocado oil. Unaware of its existence, I was in a pharmacy in Russia looking at their essential oils selection. The pharmacist kindly suggested for me to try the avocado oil due to its important properties."
//
//        a6.is(relationship: "Post").in(object: c3)
//
//        let a7 = Entity(type: "Article")
//        a7["title"] = "Breakfast Smoothie"
//        a7["detail"] = "facebook.com/healthymind.io"
//        a7["photo"] = UIImage.load(contentsOfFile: "photo4", ofType: "jpg")?.resize(toHeight: 300)
//        a7["content"] = "Wake up to a delicious smoothie that will provide you with much needed nutrients!"
//
//        a7.is(relationship: "Post").in(object: c3)
//
//        let a8 = Entity(type: "Post")
//        a8["title"] = "Get Obsessed with this Vegan French Toast!"
//        a8["detail"] = "facebook.com/healthymind.io"
//        a8["photo"] = UIImage.load(contentsOfFile: "photo5", ofType: "jpg")?.resize(toHeight: 300)
//        a8["content"] = "If you are reading this, it means that I wasn't the only person who had no idea how easy it is to make a mind-blowing delicious Vegan French Toast! :)"
//
//        a8.is(relationship: "Post").in(object: c3)
        
        graph.sync()
    }
}

