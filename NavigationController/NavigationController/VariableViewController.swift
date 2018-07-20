//
//  VariableViewController.swift
//  NavigationController
//
//  Created by Gowthaman on 26/04/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import UIKit

// Commaon Variables
public var tokenSucces: String {
    return UserDefaults.standard.string(forKey: "token") ?? ""
}

public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

public var colOneByThree: CGFloat {
    return 0
}
public var colTwoByThree: CGFloat {
    return (UIScreen.main.bounds.width / 3)
}
public var colThreeByThree: CGFloat {
    return ((UIScreen.main.bounds.width / 3) * 2)
}
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
public var baseURL: String {
    return "https://stagewebservice.healthaadhar.com/"
}
public var token: String{ return UserDefaults.standard.string(forKey: "token") ?? "" }


extension UIViewController {
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    func alert(title: String = "Error", message: String = "", action:String = "OK") {
        DispatchQueue.main.async {
            let controller = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            controller.addAction(UIAlertAction.init(title: action, style: .default, handler: nil))
            self.present(controller, animated: true, completion: nil)
        }
    }
}


func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
    let textColor = UIColor.black
    let textFont = UIFont(name: "Helvetica", size: 12)!
    
//    let scale = UIScreen.main.scale
    UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 100), false, 2.0)
    
    let textFontAttributes = [
        NSAttributedStringKey.font: textFont,
        NSAttributedStringKey.foregroundColor: textColor,
        ] as [NSAttributedStringKey : Any]
    image.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: 75, height: 75)))
    
    let rect = CGRect(origin: point, size: CGSize(width: 100, height: 100))
    text.draw(in: rect, withAttributes: textFontAttributes)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

