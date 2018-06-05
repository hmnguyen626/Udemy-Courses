//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            // Check if any error is sent back from callback
            if error != nil {
                print(error!)
            } else {
                // Success
                print("Registration successful.")
                
                // Send user to chatViewController
                // Because we are in a closure, we need to use self
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
                SVProgressHUD.dismiss()
            }
        }
        

        
        
    } 
    
    
}
