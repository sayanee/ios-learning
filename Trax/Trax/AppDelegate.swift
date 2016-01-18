//
//  AppDelegate.swift
//  Trax
//
//  Created by Sayanee Basu on 18/1/16.
//  Copyright © 2016 Sayanee Basu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(app: UIApplication, openURL url: NSURL) -> Bool {
        print("url: \(url) ")
        return true
    }


}

