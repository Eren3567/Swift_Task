//
//  ViewController.swift
//  süre
//
//  Created by Eren Çetintaş on 19.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var zamannlabel: UILabel!
    @IBOutlet weak var zamantext: UITextField!
    var Time = Timer()
    var kalanzaman = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func button(_ sender: Any) {
        
        
        Time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(zaman_fonksiyonu), userInfo: nil, repeats: true)
    }
        
        @objc func zaman_fonksiyonu(){
            zamannlabel.text = "zaman:\(kalanzaman)"
            
            kalanzaman = kalanzaman-1
            
            if kalanzaman == 0 {
                zamannlabel.text = " zaman bitti"
            Time.invalidate()
                
            }
        
    }
    
}

