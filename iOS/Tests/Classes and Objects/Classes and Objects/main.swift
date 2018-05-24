//
//  main.swift
//  Classes and Objects
//
//  Created by Hieu Nguyen on 3/29/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import Foundation

let car1 = Car(whatColor: "blue", howManySeats: 3, whatType: .Sedan)        // Notice our enum requires . to access CarType
car1.printDetails()

print("\n------------\n")

let car2 = Car()
car2.printDetails()

print("\n------------\n")

let mySelfDrivingCar = SelfDrivingCar(whatColor: "blue", howManySeats: 3, whatType: .SelfDriving)
mySelfDrivingCar.printDetails()

// set value for optional and force unwrap example
mySelfDrivingCar.destination = "1 Hacker Way"
mySelfDrivingCar.drive()
