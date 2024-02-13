//
//  ViewController.swift
//  CoreData2
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit
import CoreData


let appDelegate = UIApplication.shared.delegate as! AppDelegate
var personList = [Person_1]()
class ViewController: UIViewController {

    let context1 = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
   // save()
       // readData()
        //deleteData()
       // sortData()
        filterData()
        
    }

    func save (){
        
        let p = Person_1(context: context1)
        
        p.age = 20
        p.name = "name3"
        
        appDelegate.saveContext()
        
    }
    
    func readData() {
        
        do { personList = try context1.fetch(Person_1.fetchRequest())
            
        }
        catch{ print("error")
            
           
        }
        for p in personList {
            
           print(p.age)
            print(p.name!)
        }
    }
    
    func deleteData(){
        
        let a = personList[1]
        
        context1.delete(a)
    }
    func sortData (){
        
        let fetchRequest: NSFetchRequest<Person_1> = Person_1.fetchRequest()
        
        let sort = NSSortDescriptor(key: #keyPath(Person_1.age), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do { personList = try context1.fetch(fetchRequest)
            
        }
        catch{ print("error")
            
           
        }
        for p in personList {
            
           print(p.age)
            print(p.name!)
        }
    }
    
    func filterData (){
        
        let fetchRequest: NSFetchRequest<Person_1> = Person_1.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "age == %i and name == %@ ", 20, "name1")
        
        do { personList = try context1.fetch(fetchRequest)
            
        }
        catch{ print("error")
            
           
        }
        for p in personList {
            
           print(p.age)
            print(p.name!)
        }
    }
    
    
}

