//
//  Car.swift
//  Classes and Objects
//
//  Created by Hieu Nguyen on 3/29/18.
//  Copyright © 2018 HMdev. All rights reserved.
//
/*  -Description-
 :Demonstrating constructing a class from scratch.
*/
import Foundation

/*
 Enum: Creating an enum is equivalent to creating a new data type.  For example Strings are a data type of string of characters.
*/
enum CarType {
    case Sedan
    case Coupe
    case Hatchback
    case SelfDriving
}

class Car {
    
    // properties
    var color : String = "Black"
    var seats : Int = 5
    var typeOfCar : CarType = .Coupe        // We use . to access the CarType enumeration
    
    // Designated Initializer.  This is considered an event
    init(){

    }
    
    // This first thing this does is init a default copy of the object, then sets the propery values.
    // Without this, when declaring an object, we are required parameters.
    convenience init(whatColor : String, howManySeats : Int, whatType : CarType){
        self.init()
        color = whatColor
        seats = howManySeats
        typeOfCar = whatType
    }
    
    // Class method
    func printDetails(){
        print("Color: \(self.color)")
        print("Seats: \(self.seats)")
        print("Type: \(self.typeOfCar)")
    }
    
    func drive(){
        print("Manually driving")
    }
    
}
