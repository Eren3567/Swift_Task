//
//  ViewController.swift
//  DataTransfer-Show
//
//  Created by Eren Çetintaş on 19.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Text: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
     
     
        
    }

    @IBAction func SendButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let sendviewcontroller = storyboard.instantiateViewController(withIdentifier: "SheetB") as! ViewControllerB
        let entertext = Text.text
        sendviewcontroller.message = entertext!
        let SendPerson = Person(Personid: 30,PersonName: "name")
        sendviewcontroller.person = SendPerson
        self.navigationController?.pushViewController(sendviewcontroller, animated: true)
    }
    
}

