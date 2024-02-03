//
//  ViewController2.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import UIKit

class ViewController2: UIViewController {
    var name = ""
    var titlename = ""
    var imageimage: UIImage?
    
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Image2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Label3.text = name
        Label4.text = titlename
        Image2.image = imageimage
        
    }
    
    @IBAction func YellowButton(_ sender: UIButton) {
        
        sender.tintColor = UIColor.yellow
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


