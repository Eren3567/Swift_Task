//
//  ViewController.swift
//  uyarı
//
//  Created by Eren Çetintaş on 18.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password2text: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Signupbutton(_ sender: Any) {
       
        if emailtext.text == ""{
            
            let uyarımesajı = UIAlertController(title: "hata aldınız", message: "mail yok", preferredStyle: UIAlertController.Style.alert)
            let aksiyon = UIAlertAction(title: "tamam", style: UIAlertAction.Style.default, handler: nil)
            
            uyarımesajı.addAction(aksiyon)
            
            self.present(uyarımesajı, animated: true, completion: nil)}
        
         if passwordtext.text == ""{
             
             let uyarımesajı = UIAlertController(title: "hata aldınız", message: "password yok", preferredStyle: UIAlertController.Style.alert)
             let aksiyon = UIAlertAction(title: "tamam", style: UIAlertAction.Style.default, handler: nil)
             
             uyarımesajı.addAction(aksiyon)
             
             self.present(uyarımesajı, animated: true, completion: nil)}
        
        
        if passwordtext.text != password2text.text {
             
             let uyarımesajı = UIAlertController(title: "hata aldınız", message: "sifre uyuşmuyor", preferredStyle: UIAlertController.Style.alert)
             let aksiyon = UIAlertAction(title: "tamam", style: UIAlertAction.Style.default, handler: nil)
             
             uyarımesajı.addAction(aksiyon)
             
             self.present(uyarımesajı, animated: true, completion: nil)}
        
    }
    
}

