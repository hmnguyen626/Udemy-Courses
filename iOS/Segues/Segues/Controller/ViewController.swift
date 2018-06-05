//
//  ViewController.swift
//  Segues
//
//  Created by Hieu Nguyen on 6/1/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Declare a temp. variable so that the secondViewController can access
    // with destinationVC.
    var textSentBack : String?
    
    // Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var firstTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // If not nil, then set label to what was passed back from secondViewController
        if let textSentBack = textSentBack {
            firstTextLabel.text = textSentBack
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        // Because we are in the initial viewController, we can just set sender as self
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
        
    }
    
    //What this does is perform the actions before "JUST BEFORE" you transition to the next viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSecondScreen" {
            //Create a constant that holds a reference to the destination of the segue
            //Cast the destination as what type of viewController the destination is
            let destinationVC = segue.destination as! SecondViewController

            // Access secondViewControllers text1 variable
            destinationVC.text1 = textField.text!
            
        }
    }
    
}

