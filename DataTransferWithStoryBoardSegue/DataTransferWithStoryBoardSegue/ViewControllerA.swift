//
//  ViewControllerA.swift
//  DataTransferWithStoryBoardSegue
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewControllerA: UIViewController {

    @IBOutlet weak var LabelA: UILabel!
    
    var messageA  = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelA.text = messageA
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
