//
//  CoreDataHandler.swift
//  ContactCD
//
//  Created by Nitesh Srivastva on 26/03/18.
//  Copyright © 2018 Nitesh Srivastva. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSManagedObject {
    
    private class func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(username : String,mobile : String,email : String)-> Bool{
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        manageObject.setValue("Nitesh", forKey: "username")
        manageObject.setValue("9458788012", forKey: "mobile")
        manageObject.setValue("nit@gmail.com", forKey: "email")
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }

    class func fetchObject() -> [Users]? {
        let context = getContext()
        var user:[Users]? = nil
        do{
            user = try context.fetch(Users.fetchRequest())
            return user
        }
        catch{
            return user
        }
        
        
    }
    class func deleteObject(user: Users) -> Bool{
        let context = getContext()
        context.delete(user)
        do{
           try  context.save()
            return true
        }
        catch{
            return false
        }
    }
}
