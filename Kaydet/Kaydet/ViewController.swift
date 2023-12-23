//
//  ViewController.swift
//  Kaydet
//
//  Created by Eren Çetintaş on 18.12.2023.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var Text1: UITextField!
    @IBOutlet weak var Text2: UITextField!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let kaydedilennot = UserDefaults.standard.object(forKey: "ilktext")
        let kaydedilenzaman = UserDefaults.standard.object(forKey: "ikincitext")
        
        if let gelennot = kaydedilennot as? String {
            Label1.text = "yapılacak is: \(gelennot)"
        }
        if let gelenzaman = kaydedilenzaman as? String {
            Label2.text = "yapılacak is: \(gelenzaman)"
        }
        
        
        
        
    }
    
    @IBAction func SilButton(_ sender: Any) {
        
        let kaydedilennot = UserDefaults.standard.object(forKey: "ilktext")
        let kaydedilenzaman = UserDefaults.standard.object(forKey: "ikincitext")
        
        if (kaydedilennot as? String != nil){
            
            UserDefaults.standard.removeObject(forKey: "ilktext")
            Label1.text! = "Yapılacak is:"
        }
        
        if (kaydedilenzaman as? String != nil){
            
            UserDefaults.standard.removeObject(forKey: "ikincitext")
            Label2.text! = "Yapılacak is:"
        }
    }
    
    
    @IBAction func Kaydetbutton(_ sender: Any) {
        UserDefaults.standard.set(Text1.text!, forKey: "ilktext")
        UserDefaults.standard.set(Text2.text!, forKey: "ikincitext")

        Label1.text! = "yapılacak is :\(Text1.text!)"
        Label2.text! = "yapılacak is :\(Text2.text!)"
    
    }
    
    
}

