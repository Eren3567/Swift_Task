//
//  ViewControllerAdd.swift
//  ContactAppWithCoreData
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit

let context1 = appdelegate.persistentContainer.viewContext
class ViewControllerAdd: UIViewController {
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactNumber: UITextField!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func AddButton(_ sender: Any) {
     print("bu buttona basıldı")
        if let name = contactName.text, let phone = contactNumber.text {
            let person = Contacts(context: context1)
            person.phoneName = name
            person.phoneNumber2 = phone
            
            appdelegate.saveContext()
            
          
        }
    }
    
    
    
    
}

