//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


// UIPickerViewDataSource and UIPickerViewDelegate is used for the scroll wheel.
// This helps save screen real estate
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbolArrow = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!    //Of type UIPickerView
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set delegate and dataSource as ViewController
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
       
    }

    
    // Required for UIPickerViewDataSource and UIPickerViewDelegate
    // Determines the # of columns in our UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Determines the # of rows in our columns
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    // Determines the row title, so we set to our currencyArray values
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    // Determines what happens when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currencyArray[row]
        
        getCoinData(url: finalURL, currentSelectedRow: row)
    }
    
    

    
    
    
    
    //MARK: - Networking
    /***************************************************************/
    func getCoinData(url: String, currentSelectedRow: Int) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the coin price!")
                    print(response)
                    
                    let priceJSON : JSON = JSON(response.result.value!)

                    self.updateCoinPrice(json: priceJSON, row: currentSelectedRow)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues."
                }
            }

    }

    
    //MARK: - JSON Parsing
    /***************************************************************/
    func updateCoinPrice(json : JSON, row: Int) {

        if let coinResult = json["ask"].double {
            bitcoinPriceLabel.text = String(currencySymbolArrow[row]) + String(coinResult)
            
        }

    }
    




}

