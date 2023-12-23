//
//  SecondViewController.swift
//  Tablo
//
//  Created by Eren Çetintaş on 21.12.2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    var secilengörselismi = ""
    var secilenkahramanismi = ""
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = secilenkahramanismi
        imageview.image = UIImage(named: secilengörselismi)
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
