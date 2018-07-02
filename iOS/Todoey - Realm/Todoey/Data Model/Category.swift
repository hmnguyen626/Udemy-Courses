//
//  Category.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/28/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundColorHexValue: String = UIColor.randomFlat.hexValue()
    
    // Forward relationship with Realm
    // Each category can have a number of items
    let items = List<Item>()
    
}
