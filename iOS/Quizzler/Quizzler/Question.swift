//
//  Question.swift
//  Quizzler
//
//  Created by Hieu Nguyen on 5/23/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

// When we are creating a class, the normal convention is to have a capital first letter
class Question {
    
    let questionText : String
    let answer : Bool
    
    // Initializer - what happens when a new object is created
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
