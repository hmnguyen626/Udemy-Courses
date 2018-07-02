//
//  AppDelegate.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/7/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Runs when the application first launch
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            _ = try Realm()
            
        } catch {
            
        }
        
        return true
    }


}

