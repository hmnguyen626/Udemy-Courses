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

//Networking pod
import Alamofire

//JSON pod
import SwiftyJSON

//When we add a delegate, it says we are conforming to the protocols set by it.
//For example ChangeCityDelegate requires that we have the function userEnteredANewCityName
class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    //Openweathermap.org personal API key
    let APP_ID = "57fca6a93cda5e38dc84973ea80cb04e"
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()   //CLLocationManager object that handles our GPF functionalities
    let weatherDataModel = WeatherDataModel()   //new weatherdatamodel object
    var citySentBackFromUser : String?
    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var tempSwitch: UISwitch!
    
    
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
    func getWeatherData(url: String, parameters: [String : String]){
        //Provided by Alamofire documentation
        //Params: a url, the method .get (retrieves data), and parameters that is specified by our API
        //The final block is a 'callback', what should happen when there is a response
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            // When we see in, we can say that we are in a closure
            response in
            if response.result.isSuccess {
                print("Success!  Got the weather data.")
                
                // Use alamofire to make a request, and if successful we store the package 'response' and grab its value
                // We force unwrap here because we have already checked that the value is successful
                // The JSON() functionality comes from SwiftyJSON
                let weatherJSON : JSON = JSON(response.result.value!)
                
                // We have to use self. because we are inside of a closure
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                print("Error \(String(describing: response.result.error))")
                // We have to use self. because we are inside of a closure
                self.cityLabel.text = "Connection issues."
            }
        }
        
    }

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(json: JSON){
        //Grabs the temp value from JSON and cast it as a double
        //Do the same for the rest
        if let tempResult = json["main"]["temp"].double {
            
            let cityResult = json["name"].string
            let conditionResult = json["weather"][0]["id"].int
            
            //Update our weatherDataModel properties
            if tempSwitch.isOn {
                weatherDataModel.temperature = Int((tempResult * 9/5) - 459.67)
            } else {
                weatherDataModel.temperature = Int(tempResult - 273)

            }
            
            weatherDataModel.city = cityResult!
            weatherDataModel.condition = conditionResult!
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            
            //Now update our UI
            updateUIWithWeatherData()
        } else {
            cityLabel.text = "Weather unavailable."
        }
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    func updateUIWithWeatherData(){
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = String(weatherDataModel.temperature)
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        
    }
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    //Method that the locationManager does when the locationManager found a location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //grab the last value
        let location = locations[locations.count - 1]
        
        //check if location is valid.
        //If value is negative, then the location is invalid
        if location.horizontalAccuracy > 0 {
            //stop updating locating once we got a valid result
            locationManager.stopUpdatingLocation()
            
            //prevents it from printing multiple (error in time delay)
            locationManager.delegate = nil
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            //Dictionary Params to send to openweathermap.org
            //This definition is defined by the API website
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    
    //Write the didFailWithError method here:
    //If there is an error, print to console the error and update label to show user there was an error.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location unavailable."
    }
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnteredANewCityName(city: String) {
        let params : [String : String] = ["q" : city, "appid" : APP_ID]
        
        getWeatherData(url: WEATHER_URL, parameters: params)
    }

    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            
            // Sets the delegate variable we created in ChangeCityViewController as
            // self, ie, this current viewController
            destinationVC.delegate = self
        }
    }

    
    
}


