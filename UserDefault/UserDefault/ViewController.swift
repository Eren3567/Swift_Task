//
//  ViewController.swift
//  UserDefault
//
//  Created by Eren Çetintaş on 6.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = UserDefaults.standard
        // data save
        d.set("name", forKey:"name1")
        d.set(30, forKey: "age")
        d.set(true, forKey: "question")
        
        
        let friendship : [String] = ["name2","name3","name4"]
        // data save
        d.set(friendship, forKey: "list")
        
        let cityList : [String : String] = ["20" : "name5","80" : "number1"]
        // data save
        d.set(cityList, forKey: "dic")
       // data read
        let city = d.string(forKey: "name1")
        let info = d.integer(forKey: "age")
        let age = d.bool(forKey: "question")
        
       
        print(city!)
        print(info)
        print(age)
        
        
        
        let list1 = d.array(forKey: "list") as? [String] ?? [String]()
        
        print(list1[0])
        
        d.removeObject(forKey: "name1")
    }


}

