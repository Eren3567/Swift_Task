//
//  SettingViewController.swift
//  FirstFirebaseApplication
//
//  Created by Eren Çetintaş on 31.12.2023.
//

import UIKit
import Firebase
class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func CikisYapButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "Toviewcontrollervc", sender: nil)
        }
        
        catch{
           print("Hatalı")
        }
        
    }
    
}
