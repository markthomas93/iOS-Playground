//
//  ViewController.swift
//  To-Do-CoreData
//
//  Created by Himshikhar Gayan on 01/09/19.
//  Copyright © 2019 Himshikhar Gayan. All rights reserved.
//  CRUD operations using CoreData

import UIKit
import CoreData

class ViewController: UIViewController {

    var items : [Item] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTableView()
        setUpNavigationController()
        loadItems()
    }
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mainCell")
    }
    
    func setUpNavigationController(){
        navigationItem.title = "Todo"
        navigationController?.navigationBar.barTintColor = UIColor.brown
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc func save(){
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default){(action) in
            let newItem = Item(context: self.context)
            newItem.name = textField.text
            self.items.append(newItem)
            self.saveItems()
        }
        
        alert.addTextField{(alertTextFiled) in
            alertTextFiled.placeholder = "Create new Item"
            textField = alertTextFiled
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    //saving data
    func saveItems(){
        do{
            try context.save()
        }catch{
            print("Error saving item")
        }
        self.tableView.reloadData()
    }
    //loading data
    func loadItems(){
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do{
            items = try context.fetch(request)
        }catch{
            print("Error fetching items")
        }
    }
    //delete data
    func delete(index : Int){
        context.delete(items[index])
        items.remove(at: index)
        saveItems()
    }
    
    //update data
    func update(index : Int,value : String,key : String){
        items[index].setValue(value, forKey: key)
        saveItems()
    }
    

}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as? MainTableViewCell
        cell?.mainHeadingText.text = items[indexPath.row].name
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //update(index: indexPath.row, value: "I just edited this", key: "name")
        delete(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
