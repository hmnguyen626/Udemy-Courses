//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Hieu Nguyen on 5/23/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Outlets
    @IBOutlet weak var ballView: UIImageView!
    
    // Declarations
    let ballArray: [String] = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber = Int()
    
    // Functions
    func newBallImage() {
        // Assigns randomBallNumber a random number from 0-4
        randomBallNumber = Int(arc4random_uniform(4) + 1)
        ballView.image = UIImage(named: ballArray[randomBallNumber])
    }
    
    // Actions upon view load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newBallImage()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        newBallImage()
    }

    @IBAction func askButtonPressed(_ sender: UIButton) {
        newBallImage()
    }
    
}

