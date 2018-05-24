//
//  ViewController.swift
//  Delegates and Protocols
//
//  Created by Hieu Nguyen on 3/30/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        // Perform our segue
        performSegue(withIdentifier: "sendDataForward", sender: self)
    }
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If our segue identifier is "sendDataForward" then go to second VC
        if segue.identifier == "sendDataForward" {
            
            // Set the destination of our segue
            let secondVC = segue.destination as! SecondViewController
            
            // Must unwrap that optional
            secondVC.data = textField.text!
        }
    }
    
    // UITextFieldDelegate methods to fix 'return' and dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Because our app doesn't know which one is the firstResponder, we manually
        // resign it.
        textField.resignFirstResponder()
        
        return true
    }
    
}

