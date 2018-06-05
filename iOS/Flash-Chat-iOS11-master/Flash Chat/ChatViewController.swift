//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import ChameleonFramework

// ChatViewController is the delegate of UITableView, etc etc
class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Declare instance variables here
    var messageArray : [Message] = [Message]()
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self
        
        
        //TODO: Set the tapGesture here:
        // #selector is a legacy from objC
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        

        //TODO: Register your MessageCell.xib file here:
        // Steps:
        //  1. UINib(nibName: "FILENAME without .xib")
        //  2. bundle: we can set as nil, since we dont want a specify a pass
        //  3. forCellResuseIdentifier can be found in MessageCell.xib identifier property
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        // Resize our tableView to estimatedRowHeight to 120, or constraint's autodimensions
        configureTableView()
        
        // Sets up firebase's observer code to begin monitoring changes in our database
        startMonitoringForMessages()
        
        // Aesthetics to separate as a messaging app
        messageTableView.separatorStyle = .none
    }

    ///////////////////////////////////////////
    //MARK: - TableView DataSource Methods
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Copied identifier from custom class identifier value 'customMessageCell'
        // indexPath refers to the location of the cell, etc row1,row2,row3
        // Because we are using a custom cell, we must cast it as the custom class "CustomMessageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        //let messageArray = ["First Message", "Second Message", "Third Message"]
        
        // Populate our cell's messageBody and sender label text property
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        // Logic for changing color scheme depending on if current user sent message or someone else
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String? {
            // Messages we sent
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
        } else {
            cell.avatarImageView.backgroundColor = UIColor.flatTeal()
            cell.messageBackground.backgroundColor = UIColor.flatLime()
        }
        
        // Finally return cell
        return cell
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped(){
        messageTextfield.endEditing(true)
    }
    
    //TODO: Declare configureTableView here:
    func configureTableView(){
        messageTableView.rowHeight = UITableViewAutomaticDimension // Request tableview to use default value
        messageTableView.estimatedRowHeight = 120.0                // Standard for average message
        
    }
    
    
    ///////////////////////////////////////////
    //MARK:- TextField Delegate Methods
    //TODO: Declare textFieldDidBeginEditing here:
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Animate our new height constraint
        UIView.animate(withDuration: 0.5) {
            // Height = keyboard height + textField height
            self.heightConstraint.constant = 358
            
            // If a constraint has change, redraw it.
            self.view.layoutIfNeeded()
        }
    }
    
    //TODO: Declare textFieldDidEndEditing here:
    // This does not automatically get call like textFieldDidBeginEditing, therefore we must call it somewhere such as tapGesture.
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50

            self.view.layoutIfNeeded()
        }
    }

    
    ///////////////////////////////////////////
    //MARK: - Send & Recieve from Firebase
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        //TODO: Send the message to Firebase and save it in our database
        // Collapse our textfield
        messageTextfield.endEditing(true)
        
        // Temporarily disable the textField so the asynch. process can complete
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        // Create a messages database to send to our firebase db
        let messagesDB = Database.database().reference().child("messages")
        
        // Save our messages as a dictionary
        // We can access the current user's email by using firebases's method Auth.auth().currentUser?.email
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": messageTextfield.text!]
        
        // Message is saved to to our database under an automatic generated unique identifier
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Message saved in db.")
                
                // Re-enable our functions and clear messageTextField text property
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
                
            }
            
        }
        
    }
    
    //TODO: Create the retrieveMessages method here:
    func startMonitoringForMessages() {
        // Create a reference to our child database.  MAKE SURE YOUR REFERENCE TO THE DB NAME IS EXACTLY AS LISTED.
        let messageDB = Database.database().reference().child("messages")
        
        // Have firebase observe if there was any change to our database
        messageDB.observe(.childAdded, with: {
            (snapshot) in
            
            // Because of the datatype Any? which was implemented by apple as syntatic sugar to ensure ObjC API is backwards compatitable, we must
            // cast our value to a known datatype.  If we recall our database "Messages" had a Dictionary<String,String>
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            // Grab the value from the key "MessageBody" and also key "Sender"
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            // Create new Message object and set it's properties to our retrieved data
            let userMessage : Message = Message(message: text, who: sender)
            self.messageArray.append(userMessage)               // Append it to our messageArray
            
            self.configureTableView()                           // Reformat the tableView
            self.messageTableView.reloadData()                  // Reload the data in our tableView
        })
        
    }
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth().signOut()

            // If successful, then go back to rootViewController using navigationController
            navigationController?.popToRootViewController(animated: true)
            
            SVProgressHUD.dismiss()
        } catch {
            print("There was an error when signing out.")
        }

    }
}
