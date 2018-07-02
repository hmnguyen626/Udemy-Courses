//
//  ViewController.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/7/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: SwipeTableViewController {

    // Local variables
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    var selectedCategory : Category? {
        // Calls didSet immediately after the variable gets set with a value!
        didSet {
            loadItems()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView Settings
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
    }

    
    
    //------------------------------------------------------------------------------
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.backgroundColor = UIColor(hexString: todoItems?[indexPath.row].backgroundColorHexValue ?? "1D9BF6")
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            
            // Ternary conditional
            cell.accessoryType = item.done == true ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Items added"
        }
        
        return cell
    }
    
    //------------------------------------------------------------------------------
    //MARK - Tableview Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    // Accessory type logic
                    item.done = !item.done
                }
            } catch {
                print("Error saving done status: \(error)")
            }
        }
        
        tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)
        
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
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                                                
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error")
                }
            }

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

    func loadItems() {

        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)

        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print("Error trying to delete item: \(error)")
            }
        }
        
    }
}

//------------------------------------------------------------------------------
//MARK - UISearchBarDelegate Methods

extension ToDoListViewController: UISearchBarDelegate {

    func searchBarSelected(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
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














