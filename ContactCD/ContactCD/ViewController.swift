//
//  ViewController.swift
//  ContactCD
//
//  Created by Nitesh Srivastva on 26/03/18.
//  Copyright © 2018 Nitesh Srivastva. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var user = [Users]()

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = CoreDataHandler.fetchObject()
        
        do {
            
            let people = try CoreDataHandler.fetchObject()
            self.user = people!
            self.tblView.reloadData()
        } catch {}
        
//        if CoreDataHandler.saveObject(username: "Rahul", mobile: "7895462310", email: "rahu@gm.cc"){
//            user = CoreDataHandler.fetchObject()
//            for i in user!{
//                print(i.username!)
//            }
//       }
//        if CoreDataHandler.deleteObject(user: user![0]){
//            user = CoreDataHandler.fetchObject()
//            print("After Single Delete")
//            for i in user!{
//                print(i.username!)
//            }
//            print(user?.count)
//        }
//        if CoreDataHandler.cleanData(){
//            user = CoreDataHandler.fetchObject()
//            print(user?.count)
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "mobile"
            textField.keyboardType = .numberPad
        }
       
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let mobile = alert.textFields!.last!.text!
            let context = CoreDataHandler.getContext()
            let person = Users(context: context)
            person.username = name
            person.mobile = mobile
            //person.email = email
            //PersistenceServce.saveContext()
            CoreDataHandler.saveObject(username: name, mobile: mobile)
            self.user.append(person)
            self.tblView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = user[indexPath.row].username
        cell.detailTextLabel?.text = user[indexPath.row].mobile
        return cell
    }
}
        

    





