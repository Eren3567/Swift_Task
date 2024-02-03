//
//  ViewController2.swift
//  NotificationCenter
//
//  Created by Eren Çetintaş on 3.02.2024.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func NotificationButton(_ sender: Any) {
        
        let person1 = Person(name: "name",age: 30)
        NotificationCenter.default.post(name: .NotificationName, object: nil,userInfo: ["message" : "new","date": Data(),"object":person1])
        dismiss(animated: true, completion: nil)
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
