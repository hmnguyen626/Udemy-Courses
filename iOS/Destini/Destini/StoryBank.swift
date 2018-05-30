//
//  StoryBank.swift
//  Destini
//
//  Created by Hieu Nguyen on 5/23/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class StoryBank {
    
    var list = [Story]()
    
    init(){
        
        list.append(Story(whatStory: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\".", a: "I\'ll hop in. Thanks for the help!", b: "Better ask him if he\'s a murderer first."))
        
        list.append(Story(whatStory: "He nods slowly, unphased by the question.", a: "At least he\'s honest. I\'ll climb in.", b: "Wait, I know how to change a tire."))
        
        list.append(Story(whatStory: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.", a: "I love Elton John! Hand him the cassette tape.", b: "It\'s him or me! You take the knife and stab him."))
        
        list.append(Story(whatStory: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?", a: nil, b: nil))
        
        list.append(Story(whatStory: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.", a: nil, b: nil))
        
        list.append(Story(whatStory: "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\"", a: nil, b: nil))
        
    }
}
