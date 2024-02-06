//
//  ViewController.swift
//  UserDefaultCounterApps
//
//  Created by Eren Çetintaş on 6.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let d = UserDefaults.standard
        
        var data = d.integer(forKey: "data1")
        
        data = data + 1
        
        d.set(data, forKey: "data1")
        label1.text = String(data)
        
    }


}

