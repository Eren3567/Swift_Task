//
//  ViewControllerB.swift
//  DataTransferPerformSegue
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewControllerB: UIViewController {

    var SendB = ""
    @IBOutlet weak var LabelB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelB.text = SendB
        
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
