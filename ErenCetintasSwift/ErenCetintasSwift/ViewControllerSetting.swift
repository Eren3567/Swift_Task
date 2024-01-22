//
//  ViewControllerSetting.swift
//  ErenCetintasSwift
//
//  Created by Eren Çetintaş on 21.01.2024.
//

import UIKit
import Firebase
class ViewControllerSetting: UIViewController {

    @IBOutlet weak var exit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Exit(_ sender: Any) {
        do {
        try Auth.auth().signOut()
        performSegue(withIdentifier: "toVcViewController", sender: nil)
        }
        
        catch{
           print("Error")
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
