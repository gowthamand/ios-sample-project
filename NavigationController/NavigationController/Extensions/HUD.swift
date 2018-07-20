//
//  HUD.swift
//  NavigationController
//
//  Created by Gowthaman D on 03/05/18.
//  Copyright © 2018 EntityVibes.com. All rights reserved.
//

import Foundation
import SVProgressHUD


func showProgress(){
    SVProgressHUD.show()
}

func hideProgress(){
    DispatchQueue.main.async {
        SVProgressHUD.dismiss()
    }
}
