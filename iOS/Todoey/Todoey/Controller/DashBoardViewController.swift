//
//  ViewController.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/7/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray : [String] = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    //------------------------------------------------------------------------------
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Step - 1
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        // Set up text property of each label
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //------------------------------------------------------------------------------
    //MARK - Tableview Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        // Programmatically add an 'accessory' to our cell (checkmark)
        // Conditional : If tableView's current cell's accessoryType then set to none, else add a checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
        
        // Change the behavior of selecting a cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    //------------------------------------------------------------------------------
    //MARK -
    
    
    
    //------------------------------------------------------------------------------
    //MARK -
    
    
    //------------------------------------------------------------------------------
    //MARK -
    
    
    
    
    
    //------------------------------------------------------------------------------
    //MARK -
    
    
    
    
    
}

