//
//  ViewController.swift
//  DataTransferPerformSegue
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Text: UITextField!
    var Enter = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }


    @IBAction func SendB(_ sender: Any) {
        Enter = Text.text!
        performSegue(withIdentifier: "VcB", sender: Enter)
    }
    @IBAction func SendA(_ sender: Any) {
        Enter = Text.text!
        performSegue(withIdentifier: "VcA", sender: Enter)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VcA"{
          
            
            let destination1 = segue.destination as! ViewControllerA
            
            destination1.sendA = Enter
            
            
        }
        if segue.identifier == "VcB" {
            let destination2 = segue.destination as! ViewControllerB
            
            destination2.SendB = Enter
        }
    }
}

