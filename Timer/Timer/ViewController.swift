//
//  ViewController.swift
//  Timer
//
//  Created by Eren Çetintaş on 4.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var counter:Timer?
    var sayac1:Int = 1
    var sayac2:Int = 5
    
    @IBOutlet weak var ciktiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if ciktiLabel != nil {
            ciktiLabel.text = ""
        } else {
            print("error")
        }}

    @IBAction func basla(_ sender: Any) {
        
        counter = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(geriSay), userInfo: nil, repeats: true)
    }
    
    @objc func ilerSay(){
        ciktiLabel.text = String(sayac1)
        sayac1+=1
        
        if sayac1 > 6 {
            counter?.invalidate()
            ciktiLabel.text = "Süre bitti"
            sayac1 = 1
        }
        
    }
    
    @objc func geriSay(){
        ciktiLabel.text = String(sayac2)
        sayac2-=1
        
        if sayac2 < 0 {
            counter?.invalidate()
            ciktiLabel.text = "Süre bitti"
            sayac2 = 5
        }
        
    }
    
}

