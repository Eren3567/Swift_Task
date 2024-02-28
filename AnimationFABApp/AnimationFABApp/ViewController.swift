//
//  ViewController.swift
//  AnimationFABApp
//
//  Created by Eren Çetintaş on 28.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button1: UIButton!
    
    var fubStation = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //Buttonaların oval yapılması
        
        Button1.layer.cornerRadius = Button1.frame.size.width/2
        Button2.layer.cornerRadius = Button2.frame.size.width/2
        Button3.layer.cornerRadius = Button3.frame.size.width/2
        
        self.Button2.alpha = 0
        self.Button3.alpha = 0
        self.Button2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.Button3.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
     
    }

    @IBAction func ButtonAction3(_ sender: Any) {
        print("Fab main tıklandı")
        
     
        
    }
    @IBAction func ButtonAction2(_ sender: Any) {
        print("Fab birinci tıklandı")
    }
    @IBAction func ButtonAction1(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            
            if self.fubStation {
                
                self.Button2.alpha = 0
                self.Button3.alpha = 0
                
                self.Button1.transform = CGAffineTransform(rotationAngle: 0 * .pi/180)
                
                self.Button2.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.Button3.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                
                self.fubStation = false
                
            }else{
                
                self.Button2.alpha = 1
                self.Button3.alpha = 1
                
                self.Button1.transform = CGAffineTransform(rotationAngle: 45 * .pi/180)
                
                self.Button2.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.Button3.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                
                self.fubStation = true
            }
            
        }, completion: nil)
        print("Fab ikinci tıklandı")
    }
    
}

