//
//  ViewController.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/7/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit
import CoreData

class ToDoListViewController: UITableViewController {

    // Outlets
    
    // Local variables
    var itemArray : [Item] = []
    
    // Core data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadItems()
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
        
        saveItems()
        
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
            (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            
            self.itemArray.append(newItem)
            
            // NSCoder
            self.saveItems()
            
            // Reload the tableView
            self.tableView.reloadData()
            
        }
        
        // Add a textfield to our alert
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder =  "Create new Item"

            textField = alertTextField
        }
        
        // Step 3 - Add action to our UIAlertController object
        alert.addAction(alertAction)
        
        // Step 4 - Present our alert
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        
    }

    // Either use passed parameter, or a default value of = Item.fetchRequest()
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    
}

//------------------------------------------------------------------------------
//MARK - UISearchBarDelegate Methods

extension ToDoListViewController: UISearchBarDelegate {

    // When user clicks "search"
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // In any read, we need this!
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        // Use NSPredicate to query
        request.predicate = NSPredicate(format: "title CONTAINS %@", searchBar.text!)
        
        // We can sort aswell!
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        // Do the search
        loadItems(with: request)
        
    }
    
    // Reload our original list, for below logic
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            // DispatchQueue on the main thread
            DispatchQueue.main.async {
                
                // Dismiss searchBar and keyboard
                searchBar.resignFirstResponder()
                
            }
            
        }
    }
    
}














