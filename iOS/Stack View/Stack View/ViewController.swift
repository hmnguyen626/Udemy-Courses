//
//  ViewController.swift
//  Stack View
//
//  Created by Hieu Nguyen on 5/29/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateUI(value: input)
    }
    
    // Variables
    var input : Character? = nil
    var calculatorOperator : Character? = nil
    var value1 : String? = nil
    var value2 : String? = nil
    var negative : Bool = false

    // Updates our current label ui using Strings.
    // If it is nil, then set valueLabel's text property as an empty string.
    func updateUI(value: Character?){
        guard let value = value else {
            valueLabel.text = ""
            return
        }
        
        valueLabel.text?.insert(value, at: (valueLabel.text?.endIndex)!)
    }
    
    // Provide an alert to the user if an error occurs. (Typically when an optional is unwrapped and nil)
    func makeAlert(){
        // Alert
        let alert = UIAlertController(title: "Error", message: "Something has gone terribly wrong.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) { (UIAlertAction) in
            self.resetCalculator()
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // If x and y is not nil, then return a String, else return a nil.
    // In this case if it is returned as nil, then our logic will present an error @163
    var calculateValues: (String?, String?, Character?) -> String? = { x, y, logic in
        switch logic {
        case "+":
            guard let x = x, let y = y else {
                return nil
            }

            return String(Float(x)! + Float(y)!)
        case "-":
            guard let x = x, let y = y else {
                return nil
            }
            
            return String(Float(x)! - Float(y)!)
        case "X":
            guard let x = x, let y = y else {
                return nil
            }
            
            return String(Float(x)! * Float(y)!)
        case "/":
            guard let x = x, let y = y else {
                return nil
            }
            
            return String(Float(x)! / Float(y)!)
        case "%":
            guard let x = x, let y = y else {
                return nil
            }
            
            // '%' is unavailable: For floating point numbers use truncatingRemainder instead
            // Source: https://stackoverflow.com/questions/40495301/what-does-is-unavailable-use-truncatingremainder-instead-mean
            return String(Float(x)!.truncatingRemainder(dividingBy: Float(y)!))
        default:
            return nil
        }
    }
    
    // Resets all variable to initial conditions
    func resetCalculator(){
        input = nil
        calculatorOperator = nil
        value1 = nil
        value2 = nil
        updateUI(value: input)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            // If tag value is from range 0-9, then it will be passed as a Character
        case 0...9:
            updateUI(value: Character("\(sender.tag)"))
        case 10:
            // Initial conditions
            resetCalculator()
        case 11:
            // Sets negative value
            if(negative){
                valueLabel.text?.remove(at: (valueLabel.text?.startIndex)!)
                negative = false
            } else {
                valueLabel.text?.insert("-", at: (valueLabel.text?.startIndex)!)
                negative = true
            }
        case 12:
            // Store first value for later use and set operator
            value1 = valueLabel.text
            calculatorOperator = "%"
            
            updateUI(value: nil)
        case 13:
            // Store first value for later use and set operator
            value1 = valueLabel.text
            calculatorOperator = "/"
            
            updateUI(value: nil)
        case 14:
            // Store first value for later use and set operator
            value1 = valueLabel.text
            calculatorOperator = "X"
            
            updateUI(value: nil)
        case 15:
            // Store first value for later use and set operator
            value1 = valueLabel.text
            calculatorOperator = "-"
            
            updateUI(value: nil)
        case 16:
            // Store first value for later use and set operator
            value1 = valueLabel.text
            calculatorOperator = "+"
            
            updateUI(value: nil)
        case 17:
            // If our string contains a "." already, then break.
            if (valueLabel.text?.contains("."))!{
                break
            } else {
                updateUI(value: ".")
            }
        case 18:
            // Store second value for use in "=" operator with value 1
            value2 = valueLabel.text
            
            // Validate that optional is not nil, else present an alert to user
            if let value1 = value1, let value2 = value2 {
                // Presents an alert to user if there is an error in logic, else assign valueLabel.text to correct result.
                if calculateValues(value1, value2, calculatorOperator) == "Broken logic" {
                    makeAlert()
                } else {
                    valueLabel.text = calculateValues(value1, value2, calculatorOperator)
                }
            } else {
                makeAlert()
            }
        default:
            print("Invalid tag.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

