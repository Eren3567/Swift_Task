//
//  ViewController.swift
//  ikinciviewcontrol2
//
//  Created by Eren Çetintaş on 17.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var girisyaptext: UITextField!
    @IBOutlet weak var Birinciviewcontroller: UITextField!
    
    var alınansifre = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("did appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        girisyaptext.text!=""
    }
    @IBAction func Kontroletbutton(_ sender: Any) {
        
        alınansifre = girisyaptext.text!
        
        performSegue(withIdentifier: "Toikincivc", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Toikincivc"{
            
            var destinationvc = segue.destination as! ikinciViewController
            destinationvc.verilensifre = alınansifre
            
        }
        func ikincivcyegitbutton(_ sender: Any) {
        }
    }
    
}
