//
//  ViewController.swift
//  Passing Data with Protocols and Delegates
//
//  Created by Hieu Nguyen on 6/1/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

// Use delegates and protocols to TRULY send data back
class ViewController: UIViewController, CanReceiveData{
    
    // Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    // Variables
    var firstVCText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "sendForwardSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendForwardSegue" {
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.secondVCText = textField.text!
            
        }
    }
    
    func dataReceived(data: String) {
        textLabel.text = data
    }
    
    
}

