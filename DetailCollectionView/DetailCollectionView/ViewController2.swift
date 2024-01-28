//
//  ViewController2.swift
//  DetailCollectionView
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import UIKit

class ViewController2: UIViewController {
 var Label4Text = ""
    var Image2image = ""
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Image2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Label4.text = Label4Text
        Image2.image = UIImage(named: Image2image)
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
