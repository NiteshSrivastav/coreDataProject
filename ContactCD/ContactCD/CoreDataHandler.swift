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
    
     class func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(username : String,mobile : String)-> Bool{
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        manageObject.setValue(username, forKey: "username")
        manageObject.setValue(mobile, forKey: "mobile")
      //  manageObject.setValue(email, forKey: "email")
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
    class func cleanData() -> Bool {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: Users.fetchRequest())
        do{
            try context.execute(delete)
            return true
        }
        catch{
            return false
        }
    }
}
