//
//  ViewController.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/7/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    // Local variables
    var itemArray : [Item] = []
    
    // Defaults (store user data)
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item(title: "Find Mike")
        itemArray.append(newItem)
        
        let newItem2 = Item(title: "Destroy Demogorgon")
        itemArray.append(newItem2)
        
        // Gets stored data from defaults and cast it as an array of String
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }

    }

    
    
    //------------------------------------------------------------------------------
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Step - 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        // Set up text property of each label
        cell.textLabel?.text = item.title
        
        // Ternary conditional
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
    
    //------------------------------------------------------------------------------
    //MARK - Tableview Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Set our Item to done = true if not true, else set false
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // Change the behavior of selecting a cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Reload tableview data
        tableView.reloadData()
    }
    
    //------------------------------------------------------------------------------
    //MARK - Add and append a new item to itemArray
    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {
    
        //------------------------------------------------------------------------------
        //MARK - Alert
        
        // Local variable
        var textField = UITextField()
        
        // Step 1 - Make a UIAlertController
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        
        // Step 2 - Make an action
        let alertAction = UIAlertAction(title: "Add Item", style: .default) {
            // Closure
            (action) in
            
            // Because we are in a closure, we must use .self, to assign this ViewController as to where itemArray exists
            let newItem = Item(title: textField.text!)
            self.itemArray.append(newItem)
            
            // Save updated itemArray to our userdefaults
            // self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            let encoder = PropertyListEncoder()
            
            
            // Reload the tableView
            self.tableView.reloadData()
            
        }
        
        // Add a textfield to our alert
        alert.addTextField { (alertTextField) in
            
            // Just a placeholder
            alertTextField.placeholder =  "Create new Item"
            
            // Because this is within a closure, we need to use a local variable to grab the information written by the user and assign it to our local variable
            textField = alertTextField
        }
        
        // Step 3 - Add action to our UIAlertController object
        alert.addAction(alertAction)
        
        // Step 4 - Present our alert
        present(alert, animated: true, completion: nil)
    }
    
    

    
    
    

    


    
    
    //------------------------------------------------------------------------------
    //MARK -
    
    
    
    
    
    //------------------------------------------------------------------------------
    //MARK -
    
    
    
    
    
}

