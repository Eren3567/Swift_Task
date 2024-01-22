//
//  ViewController.swift
//  AlertApplication
//
//  Created by Eren Çetintaş on 22.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
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
        self.present(alertcontroller, animated: true, completion: nil)
    }
}
