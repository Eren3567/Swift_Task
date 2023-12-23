//
//  ViewController.swift
//  HesapYapma
//
//  Created by Eren Çetintaş on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ilksayi: UITextField!
    @IBOutlet weak var ikincisayi: UITextField!
    
    
    @IBOutlet weak var Sonuc: UILabel!
    
    var sonucc = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func arti(_ sender: Any) {
        if let ilk = Int (ilksayi.text!) {
            if let ikinci = Int (ikincisayi.text!){
                sonucc = ilk + ikinci
                Sonuc.text = String(sonucc)
            }
        }
        
        


        Sonuc.text = String(sonucc)
        
    }
    @IBAction func eksi(_ sender: Any) {
        
        let ilk = Int (ilksayi.text!)!
        let ikinci = Int (ikincisayi.text!)!
     sonucc = ilk - ikinci

        Sonuc.text = String(sonucc)
    }
    
    @IBAction func bölme(_ sender: Any) {
        let ilk = Int (ilksayi.text!)!
        let ikinci = Int (ikincisayi.text!)!
          sonucc = ilk / ikinci

        Sonuc.text = String(sonucc)
    }
    
    @IBAction func carpma(_ sender: Any) {
        let ilk = Int (ilksayi.text!)!
        let ikinci = Int (ikincisayi.text!)!
     sonucc = ilk * ikinci

        Sonuc.text = String(sonucc)
    }
    
    
}

