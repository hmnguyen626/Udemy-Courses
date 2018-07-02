//
//  Item.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/28/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    @objc dynamic var backgroundColorHexValue: String = UIColor.randomFlat.hexValue()
    
    // Inverse Relationship
    // Links each item back to a parent category
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
