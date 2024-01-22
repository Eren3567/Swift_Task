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
        
        if Password.text! != nil && Email.text != nil{
            Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { (AuthDataResult, error) in
                if error != nil {
                    
                    self.ErrorMessage(titleinput: "Error", messageinput: error?.localizedDescription ?? "Try again")
                }
                
                else{
                    
                    self.performSegue(withIdentifier: "ToVCMain", sender: nil)
                }
            }
            }
        else{
            
            ErrorMessage(titleinput: "Error", messageinput: "Enter email and password")
        }
            
            
        }
    
    @IBAction func SigninButton(_ sender: Any) {
        
        if Email.text != "" && Password.text != "" {
            
            Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) { (AuthDataResult, error) in
                if error != nil {
                    
                    self.ErrorMessage(titleinput: "Error", messageinput: error?.localizedDescription ?? "Try again")
                }
                
                else{ self.performSegue(withIdentifier: "ToVCMain", sender: nil)
                    
                    
                    
                }
            }
        }
        
        else{
            ErrorMessage(titleinput: "Error", messageinput: "Enter Email and Password")
        }}
        
        func ErrorMessage (titleinput:String,messageinput:String){
            let alert = UIAlertController(title: titleinput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
            
            let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okbutton)
            self.present(alert, animated: true, completion: nil)
        }
        
   
    
}

