//
//  ViewControllerDetail.swift
//  ContactAppWithCoreData
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit

class ViewControllerDetail: UIViewController {
    let context1 = appdelegate.persistentContainer.viewContext
    var kisi : Contacts?
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        Label2.text = kisi?.phoneNumber2
        Label1.text = kisi?.phoneName
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
