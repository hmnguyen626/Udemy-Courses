//
//  ViewController.swift
//  Dicee
//
//  Created by Hieu Nguyen on 3/25/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    var sum : Int = 0
    
    // Outlets
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var totalSum: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Get random dice image at start of view
        changeDice()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeDice(){
        //Get random dice index values
        randomDiceIndex1 = Int(arc4random_uniform(6)) + 1
        randomDiceIndex2 = Int(arc4random_uniform(6)) + 1
        
        //Set our imageview's image property to a new dice image according to randomDiceIndex
        diceImageView1.image = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceIndex2)")
    }
    
    //Update dice images if motion is detected
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?){
        changeDice()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //Reset sum
        sum = 0

        //Changes dice image
        changeDice()
        
        //Set our total label text property to the sum dices
        sum = randomDiceIndex1 + randomDiceIndex2
        totalSum.text = "Total: \(sum)"
    }
}

