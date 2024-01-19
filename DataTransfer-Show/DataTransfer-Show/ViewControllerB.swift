//
//  ViewControllerB.swift
//  DataTransfer-Show
//
//  Created by Eren Çetintaş on 19.01.2024.
//

import UIKit

class ViewControllerB: UIViewController {
    var message : String? = nil
    var person = Person()
    
    @IBOutlet weak var Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(person.PersonName!)
        Label.text = message
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
