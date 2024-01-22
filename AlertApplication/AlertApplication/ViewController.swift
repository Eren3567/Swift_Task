//
//  ViewController.swift
//  AlertApplication
//
//  Created by Eren Çetintaş on 22.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Alert1(_ sender: Any) {
        
        let alertcontroller = UIAlertController(title:"Title", message: "Alert", preferredStyle: UIAlertController.Style.alert)
        
        let alertactioncancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            
            print("cancel")
            
            
        }
        alertcontroller.addAction(alertactioncancel)
        
        let alertactionok = UIAlertAction(title: "ok", style: .destructive) {
            action in
            print("ok")
            
        }
        alertcontroller.addAction(alertactionok)
        self.present(alertcontroller, animated: true)
    }
    
    
    @IBAction func Alert2(_ sender: Any) {
        
        let alertcontroller2 = UIAlertController(title: "Title", message: "Alert2", preferredStyle: .alert)
        
        alertcontroller2.addTextField {
            textfield in
            
            textfield.placeholder = "email"
            textfield.keyboardType = .emailAddress
            
        }
        alertcontroller2.addTextField {
            textfield in
            
            textfield.placeholder = "password"
            textfield.isSecureTextEntry = true
            
            
        }
        let action = UIAlertAction(title: "save", style: .default){ action1 in
            
            
            let getemail = (alertcontroller2.textFields![0] as UITextField).text!
            let getpassword = (alertcontroller2.textFields![1] as UITextField).text!
            
            self.Label.text = "Email:\(getemail)-Password:\(getpassword)"
        }
        alertcontroller2.addAction(action)
        self.present(alertcontroller2, animated: true, completion: nil)
        
    }
}
