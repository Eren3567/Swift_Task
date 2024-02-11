//
//  ViewController.swift
//  CoreData1
//
//  Created by Eren Çetintaş on 9.02.2024.
//

import UIKit
import CoreData
let appdelegate =  UIApplication.shared.delegate as! AppDelegate
var personList = [Person_1]()
class ViewController: UIViewController {
    let context1 = appdelegate.persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Save()
        readData()
     deleteData()
        readData()

    }
    func Save () {
        
        let b = Person_1(context: context1)
        
        b.age = 38
        b.name = "name2"
        
        appdelegate.saveContext()
    }
    
    func readData (){
        
        do{
            personList = try context1.fetch(Person_1.fetchRequest())
        }
            
            catch{ print("error")
            
            }
            
        for p in personList{
            
            print(p.name!)
            print(p.age)
        }
        }
    
    
    func deleteData(){
    
        let a = personList[0]
        
        context1.delete(a)
        
     appdelegate.saveContext()
        
        
        
    }
    }

