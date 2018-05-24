//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Hieu Nguyen on 3/29/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import Foundation

// Inheritance practice - Our new SelfDrivingCar class is now a subclass of Car superclass
class SelfDrivingCar : Car {
    
    // Properties
    //var destination : String = "1 Infinite Loop"
    
    // Optional - This means, this COULD contain nil
    var destination : String?
    
    // Overriding super class drive() method
    override func drive(){
        super.drive()   // Includes everything from superclass method
        
        // Includes new functionality
//        if destination != nil {
//            print("Now on auto mode to " + destination!)   // ! force unwraps our optional
//        } else {
//            print("destination is nil.")
//        }
        
        // 'Optional binding' equivalence to top.  Code block only executes if destination has a value and NOT nil.
        // This method does not require any force unwrapping, meaning this is safer.
        if let userDestination = destination {
            print("Now on auto mode to " + userDestination)   // ! force unwraps our optional
        }

    }
    
}
