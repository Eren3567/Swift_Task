//
//  ViewController.swift
//  AllowInApp
//
//  Created by Eren Çetintaş on 3.02.2024.
//

import UIKit

class ViewController: UIViewController {
    var allowControl : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { (granted,error) in
            
            self.allowControl = granted
            
            if granted {
                
                print("successful")
            }else{
                
                print("aaaaa")
            }
            
            
        })
        
        
    }
    
}
