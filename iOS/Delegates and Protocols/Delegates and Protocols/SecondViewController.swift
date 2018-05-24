//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Hieu Nguyen on 3/30/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    // Variable
    var data = ""
    
    // Outlets
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        secondLabel.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendBackButtonPressed(_ sender: UIButton) {
    }
    

}
