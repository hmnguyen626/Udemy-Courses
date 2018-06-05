//
//  SecondViewController.swift
//  Segues
//
//  Created by Hieu Nguyen on 6/1/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    //Outlets
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    
    //Variables
    var text1 : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textlabel.text = text1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goBackToFirstViewController", sender: self)
    }
    
    // Prepares for transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToFirstViewController" {
            let destinationVC = segue.destination as! ViewController

            destinationVC.textSentBack = secondTextField.text
        }
    }

}
