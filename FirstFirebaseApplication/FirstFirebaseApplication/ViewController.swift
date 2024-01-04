//
//  ViewController.swift
//  FirstFirebaseApplication
//
//  Created by Eren Çetintaş on 30.12.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var sifrenizigiriniztext: UITextField!
    @IBOutlet weak var emailgiriniztext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func GirisYapınızButton(_ sender: Any) {
        
        
        if emailgiriniztext.text != "" && sifrenizigiriniztext.text != ""{
            
            Auth.auth().signIn(withEmail: emailgiriniztext.text!, password: sifrenizigiriniztext.text!) { (AuthDataResult, Error )in
                if Error != nil{
                    self.hatamesajı(titleinput: "Hata", messageinput: Error!.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "ToFeedVc", sender: nil)
                }
            }
        }
            else    {
            
                hatamesajı(titleinput: "Hata", messageinput: "kullanıcı adı ve sifre giriniz")
            }
        
        
    }
    @IBAction func KayitOlunuzButton(_ sender: Any) {
        performSegue(withIdentifier: "ToFeedVc", sender: nil)
        
        if emailgiriniztext.text != "" && sifrenizigiriniztext.text != ""{
            // kayıt olma
            Auth.auth().createUser(withEmail: emailgiriniztext.text!, password: sifrenizigiriniztext.text!) { (AuthDataResult, Error) in
                if Error != nil{
                    self.hatamesajı(titleinput: "Hata", messageinput: Error!.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "ToFeedVc", sender: nil)
                }
            }
        }
            else    {
            
                hatamesajı(titleinput: "Hata", messageinput: "kullanıcı adı ve sifre giriniz")
            }
            
        }
        
        func hatamesajı(titleinput: String, messageinput : String)
        {
            let alert = UIAlertController(title: titleinput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
            let Okbut = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(Okbut)
            self.present(alert, animated: true, completion: nil)
        }
        
    }


