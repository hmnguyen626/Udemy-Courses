//
//  Story.swift
//  Destini
//
//  Created by Hieu Nguyen on 5/23/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    let story : String
    let answerA : String?
    let answerB : String?
    
    init(whatStory: String, a: String?, b: String?){
        story = whatStory
        answerA = a
        answerB = b
    }
    
}
