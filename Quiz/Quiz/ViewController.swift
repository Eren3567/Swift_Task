//
//  ViewController.swift
//  Quiz
//
//  Created by Eren Çetintaş on 9.02.2024.
//

import UIKit
import Firebase
import FirebaseAuth





class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LoginButton(_ sender: Any) {
       
        if emailText.text != "" && passwordText.text != ""{
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (AuthDataResult, error )in
                if error != nil{
                    self.errorMessage(titleinput: "Error", messageinput: error!.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "ToFeedVc", sender: nil)
                }
            }
        }
        else    {
            
            errorMessage(titleinput: "Error", messageinput: "Enter Username and password")
        }
        
        
    }
    
    @IBAction func SigninButton(_ sender: Any) {
        
        
               if emailText.text != "" && passwordText.text != ""{
                   // kayıt olma
                   Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (AuthDataResult, Error) in
                       if Error != nil{
                           self.errorMessage(titleinput: "Hata", messageinput: Error!.localizedDescription)
                       }
                       else{
                           self.performSegue(withIdentifier: "ToFeedVc", sender: nil)
                       }
                   }
               }
                   else    {
                   
                       errorMessage(titleinput: "Error", messageinput: "enter username and password")
                   }
                   
               
        
        
        
        
        }
        
        
    
    
func errorMessage (titleinput: String, messageinput : String)
{
    let alert = UIAlertController(title: titleinput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
    let Okbut = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
    
    alert.addAction(Okbut)
    self.present(alert, animated: true, completion: nil)
}

    
}
