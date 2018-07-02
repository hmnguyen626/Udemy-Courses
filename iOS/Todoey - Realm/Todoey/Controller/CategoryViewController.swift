//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/27/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {

    // Init new realm
    let realm = try! Realm()
    
    // Results is an auto-updating object from Realm, therefore we can forego calling .append when saving
    var categories: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        loadCategories()
        
        // TableView Settings
        tableView.rowHeight = 80.0
        tableView.separatorStyle = .none
        
    }

    // MARK: Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // Create alert with a textfield to add
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default) {
            (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        }
        
        alert.addTextField { (field) in
            
            field.placeholder = "Add new category"
            textField = field
        
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Nil Coealescing Operator:  Could be nil; if nil then return 1 instead, else return # of categories
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.backgroundColor = UIColor(hexString: categories?[indexPath.row].backgroundColorHexValue ?? "1D9BF6")
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories added yet"
        
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToItems" {
            let destinationVC = segue.destination as! ToDoListViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                destinationVC.selectedCategory = categories?[indexPath.row]
                
            }
            
            
        }
        
    }
    
    // Mark: - Data Manipulation Methods
    func save(category: Category){
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error trying to save category: \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(){
         categories = realm.objects(Category.self)
        
         tableView.reloadData()
    }
    
    // Mark: - Delete Data from Swipe
    override func updateModel(at indexPath: IndexPath) {
        
        if let categoryForDeletion = self.categories?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categoryForDeletion)
                }
            } catch {
                print("Error deleting category: \(error)")
            }
        }
        
    }
    
    
    
    
}











