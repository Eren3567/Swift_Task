//
//  ViewControllerUpdate.swift
//  ContactAppWithCoreData
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit

class ViewControllerUpdate: UIViewController {
    let context1 = appdelegate.persistentContainer.viewContext
    var kisi  : Contacts?
    @IBOutlet weak var ContactNumberUpdate: UITextField!
    @IBOutlet weak var ContactNameUpdate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        ContactNameUpdate.text = kisi?.phoneName
        ContactNumberUpdate.text = kisi?.phoneNumber2
    }
    

    @IBAction func Update(_ sender: Any) {
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
