//
//  ViewController.swift
//  TabBar
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var onecounter = 0
    var twocounter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        
      
    }

    @IBAction func İncrease1(_ sender: Any) {
        
        
          if let tabitems = tabBarController?.tabBar.items {
              
              let profileTabBarItem = tabitems[0]
              onecounter = onecounter + 1
              
              profileTabBarItem.badgeColor = .systemBlue
              profileTabBarItem.badgeValue = String(onecounter)
          }
    }
    
    @IBAction func decrease2(_ sender: Any) {
        
        
          if let tabitems2 = tabBarController?.tabBar.items {
              
              let profileTabBarItem2 = tabitems2[1]
              twocounter = twocounter - 1
              
              profileTabBarItem2.badgeColor = .systemBlue
              profileTabBarItem2.badgeValue = String(twocounter)
          }
    }
}

