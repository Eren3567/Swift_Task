//
//  ViewController2.swift
//  Tableview2
//
//  Created by Eren Çetintaş on 23.12.2023.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var bölgebutton: UIButton!
    
    @IBOutlet weak var detaylabel: UILabel!
    @IBOutlet weak var isimlabel: UILabel!
    @IBOutlet weak var isimbutton: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    
    var secilenisim : grafik?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imageview.image = secilenisim?.görsel
        isimlabel.text = secilenisim?.isim
        detaylabel.text = secilenisim?.detay
        
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
