//
//  Items.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/12/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import Foundation

class Item {
    
    let title: String
    var done: Bool
    
    init(title: String){
        self.title = title
        self.done = false
    }
    
}
