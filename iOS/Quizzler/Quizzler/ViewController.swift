//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Place your instance variables here
    let questions = QuestionBank()
    var questionCounter = 0
    var score = Int()
    var progressIndex = Int()
    
    // Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update our initial UI
        startOver()
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            checkAnswer(selected: true)
        case 2:
            checkAnswer(selected: false)
        default:
            print("default")
        }
        
        updateUI()
    }
    
    
    func updateUI() {
        // Update new question and other labels
        nextQuestion()
        progressLabel.text = String(progressIndex) + " /13"
        scoreLabel.text = String(score)
        
        // Make our progress bar the size of our screen division by 13
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(progressIndex)
        
    }
    

    func nextQuestion() {
        // Condition to cycle through questions list
        if(questionCounter < 12) {
            questionCounter += 1
            progressIndex += 1
            
        } else {
            // Create an alert for user
            let alert = UIAlertController(title: "Game over", message: "You have completed all the questions.  Would you like to start over?", preferredStyle: .alert)
            // Create an alert action
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            // Add restartAction to our alert
            alert.addAction(restartAction)
            
            // Present the alert action to our viewController
            present(alert, animated: true, completion: nil)
        }
        
        // Update questionLabel
        questionLabel.text = questions.list[questionCounter].questionText
    }
    
    
    func checkAnswer(selected: Bool) {
        // If selected is correct answer, then update score value
        if(selected == questions.list[questionCounter].answer){
            score += 1
            
        }
    }
    
    
    func startOver() {
        score = 0
        progressIndex = 1
        questionCounter = 0
        questionLabel.text = questions.list[questionCounter].questionText
        scoreLabel.text = String(score)
        progressLabel.text = String(progressIndex) + " /13"
        progressBar.frame.size.width = (view.frame.size.width / 13)
    }
}
