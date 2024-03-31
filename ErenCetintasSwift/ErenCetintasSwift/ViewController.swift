//
//  ViewController.swift
//  ErenCetintasSwift
//
//  Created by Eren Çetintaş on 17.01.2024.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginButton(_ sender: Any) {
        guard let email = Email.text, !email.isEmpty,
                      let password = Password.text, !password.isEmpty else {
                    showAlert(title: "Error", message: "Enter email and password")
                    return
                }
                
                Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                    if let error = error {
                        self.showAlert(title: "Error", message: error.localizedDescription)
                    } else {
                        self.performSegue(withIdentifier: "ToVCMain", sender: nil)
                    }
                }
            
        }
    
    @IBAction func SigninButton(_ sender: Any) {
        guard let email = Email.text, !email.isEmpty,
                      let password = Password.text, !password.isEmpty else {
                    showAlert(title: "Error", message: "Enter email and password")
                    return
                }
                
                Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                    if let error = error {
                        self.showAlert(title: "Error", message: error.localizedDescription)
                    } else {
                        self.performSegue(withIdentifier: "ToVCMain", sender: nil)
                    }
                }}
        
    func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
   
    
}

