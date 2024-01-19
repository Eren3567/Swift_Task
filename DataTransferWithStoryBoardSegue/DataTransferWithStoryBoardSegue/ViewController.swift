//
//  ViewController.swift
//  DataTransferWithStoryBoardSegue
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Text: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let enter = Text.text
        if segue.identifier == "SendVCA"{
            
            let SendVc = segue.destination as! ViewControllerA
            SendVc.messageA = enter!
            
        }
        
        if segue.identifier == "SendVCB"{
            
            let SendVc2 = segue.destination as! ViewControllerB
            SendVc2.messageB = enter!
        }
    }


}

