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
    var bulunansifre = ""
    @IBOutlet weak var BulunanSifre: UILabel!
    var verilensifre = ""
    var ikincideger = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sifreyigösterlabel.text! = verilensifre
        ikincideger = ikinciviewcontroller.text!
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sonucBul(_ sender: Any) {   // ikinciviewcontroller alanına girilmiş bir değer var mı kontrol edin
        if let ikinciDeger = ikinciviewcontroller.text, !ikinciDeger.isEmpty {
            // Eğer değer varsa, ikincideger'e ata ve BulunanSifre label'ına yazdır
            ikincideger = ikinciDeger
            BulunanSifre.text = "\(ikincideger) \(verilensifre)"
        } else {
            // Eğer değer yoksa, sadece verilensifre'yi yazdır
            BulunanSifre.text = verilensifre
        }
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
