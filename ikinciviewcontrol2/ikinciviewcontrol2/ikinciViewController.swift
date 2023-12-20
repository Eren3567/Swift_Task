//
//  ikinciViewController.swift
//  ikinciviewcontrol2
//
//  Created by Eren Çetintaş on 17.12.2023.
//

import UIKit

class ikinciViewController: UIViewController {
    @IBOutlet weak var sonuctext: UITextField!
    
    @IBOutlet weak var sifreyigösterlabel: UILabel!
    @IBOutlet weak var Bulunansifre: UITextField!
    @IBOutlet weak var ikinciviewcontroller: UITextField!
    
    var verilensifre = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        sifreyigösterlabel.text! = verilensifre
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
