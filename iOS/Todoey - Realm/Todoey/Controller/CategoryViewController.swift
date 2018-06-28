//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Hieu Nguyen on 6/27/18.
//  Copyright © 2018 HMdev. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    // Global constants
    var categories: [Category] = []
    
    // Core Data Context for CRUD
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()


        loadCategories()
    }

    // MARK: Add new Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        // Create alert with a textfield to add
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) {
            (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            
            self.saveCategories()
            
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
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        
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
                
                destinationVC.selectedCategory = categories[indexPath.row]
                
            }
            
            
        }
        
    }
    
    // Mark: - Data Manipulation Methods
    func saveCategories(){
        do {
            try context.save()
        } catch {
            print("Error trying to save category: \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()){
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error trying to load categories: \(error)")
        }
        
        self.tableView.reloadData()
    }
    
}
