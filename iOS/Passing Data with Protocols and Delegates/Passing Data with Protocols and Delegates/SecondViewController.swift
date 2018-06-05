//
//  SecondViewController.swift
//  Passing Data with Protocols and Delegates
//
//  Created by Hieu Nguyen on 6/1/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit



// Use protocols and delegates to TRULY send data back.
protocol CanReceiveData {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {
    // Delegates
    var delegate : CanReceiveData?
    
    // Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    // Variable
    var secondVCText : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let secondVCText = secondVCText {
            textLabel.text = secondVCText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        delegate?.dataReceived(data: textField.text!)
        
        // Dismiss our VC
        self.dismiss(animated: true, completion: nil)
    }

}
