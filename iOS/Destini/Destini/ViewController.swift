//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    var currentStoryIndex = 0
    let stories = StoryBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        startOver()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        // TODO Step 4: Write an IF-Statement to update the views
//        switch sender.tag {
//        case 1:
//            currentStoryIndex = 2
//            updateUI(whichStory: currentStoryIndex)
//        case 2:
//            currentStoryIndex = 1
//            updateUI(whichStory: currentStoryIndex)
//        default:
//            print("Hit default.")
//        }
        
        if(sender.tag == 1) {
            if(currentStoryIndex == 0) {
                currentStoryIndex = 2
                updateUI(whichStory: currentStoryIndex)
            }
            else if(currentStoryIndex == 2) {
                currentStoryIndex = 5
                updateUI(whichStory: currentStoryIndex)
            }
            else if(currentStoryIndex == 1) {
                currentStoryIndex = 2
                updateUI(whichStory: currentStoryIndex)
            }
        }
        else if(sender.tag == 2) {
            if(currentStoryIndex == 0) {
                currentStoryIndex = 1
                updateUI(whichStory: currentStoryIndex)
            }
            else if(currentStoryIndex == 1) {
                currentStoryIndex = 3
                updateUI(whichStory: currentStoryIndex)
            }
            else if(currentStoryIndex == 2) {
                currentStoryIndex = 4
                updateUI(whichStory: currentStoryIndex)
            }
            
        }
        
        
        // TODO Step 6: Modify the IF-Statement to complete the story
        
    
    }
    
    func updateUI(whichStory: Int){
        storyTextView.text = stories.list[whichStory].story
        
        if let answerA = stories.list[whichStory].answerA {
            topButton.setTitle(answerA, for: .normal)
        } else {
            topButton.isHidden = true
        }
        
        if let answerB = stories.list[whichStory].answerB {
            bottomButton.setTitle(answerB, for: .normal)
        } else {
            bottomButton.isHidden = true
        }
        
    }
    
    func startOver(){
        currentStoryIndex = 0
        topButton.isHidden = false
        bottomButton.isHidden = false
        updateUI(whichStory: currentStoryIndex)
    }


}

