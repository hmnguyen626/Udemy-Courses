//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

//Module that allows us to tap into the GPS functionality of the iPhone
import CoreLocation

//When we add a delegate, it says we are conforming to the protocols set by it
class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    //Openweathermap.org personal API key
    let APP_ID = "57fca6a93cda5e38dc84973ea80cb04e"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Set up the location manager.
        //We set it as self, ie: our current class 'viewController'.
        locationManager.delegate = self
        
        //This sets the accuracy of our locationManager.
        //The better the accuracy the longer it will take to respond and uses more battery.
        //This must be specified to access the location data
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        //Property to request user authorization to retrieve location data
        //always = running in background
        //WhenInUse = when app is in use
        //We must update the .plist file, finally.
        locationManager.requestWhenInUseAuthorization()
        
        //Asynchronous method 
        locationManager.startUpdatingLocation()
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    func getWeatherData(){
        
    }

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(){
        
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    
    
    
    //Write the didFailWithError method here:
    
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


