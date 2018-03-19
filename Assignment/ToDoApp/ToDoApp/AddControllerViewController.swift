//
//  AddControllerViewController.swift
//  ToDoApp
//
//  Created by Nitesh Srivastva on 15/03/18.
//  Copyright © 2018 Nitesh Srivastva. All rights reserved.
//

import UIKit

class AddControllerViewController: UIViewController {

    @IBOutlet weak var addDataTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        if (addDataTf.text != nil) && (addDataTf.text != ""){
            todoList?.append(addDataTf.text!)
            addDataTf.placeholder = "Add More Data"
            navigationController?.popViewController(animated: true)
        }
        
    }
    
   

}
