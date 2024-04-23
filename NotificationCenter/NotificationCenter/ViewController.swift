//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Eren Çetintaş on 3.02.2024.
//

import UIKit
extension Notification.Name {
    static let NotificationName = Notification.Name ("myBroadcating")
}
class ViewController: UIViewController {
    @IBOutlet weak var Label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.doing(notification:)), name: .NotificationName, object: nil)
    }

    @objc func doing (notification : NSNotification){
        let incomingMessage = notification.userInfo?["message"]
        let incomingDate = notification.userInfo?["date"]
        let incomingObject = notification.userInfo?["object"] as! Person
        
        Label1.text = " \(String(describing: incomingObject.name!)) - \(String(describing: incomingMessage!)) - \(String(describing: incomingObject.age!))"
    }

    @IBAction func GoButton(_ sender: Any) {
    }
}

