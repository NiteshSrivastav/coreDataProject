//
//  ViewController.swift
//  ContactCD
//
//  Created by Nitesh Srivastva on 26/03/18.
//  Copyright © 2018 Nitesh Srivastva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var user:[Users]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if CoreDataHandler.saveObject(username: "Rahul", mobile: "7895462310", email: "rahu@gm.cc"){
            user = CoreDataHandler.fetchObject()
            for i in user!{
                print(i.username)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

