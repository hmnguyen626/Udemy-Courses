//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var soundPlayer: AVAudioPlayer?
    
    // Simple
    func playSound(whichSound: String) {
        guard let url = Bundle.main.url(forResource: whichSound, withExtension: "wav") else { return }
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {       // What should happen if there is an error
            print(error)
        }
        
        soundPlayer?.play()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        // Here sender is of UIButton because of our IBAction outlet
        switch sender.tag {
        case 1:
            playSound(whichSound: "note1")
        case 2:
            playSound(whichSound: "note2")
        case 3:
            playSound(whichSound: "note3")
        case 4:
            playSound(whichSound: "note4")
        case 5:
            playSound(whichSound: "note5")
        case 6:
            playSound(whichSound: "note6")
        case 7:
            playSound(whichSound: "note7")
        default:
            print("None")
        }
        
    }

}

