//
//  ViewController.swift
//  AllowInApp
//
//  Created by Eren Çetintaş on 3.02.2024.
//

import UIKit

class ViewController: UIViewController {
    var allowControl : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound], completionHandler: { (granted,error) in
            UNUserNotificationCenter.current().delegate = self
            self.allowControl = granted
            
            if granted {
                
                print("successful")
            }else{
                
                print("aaaaa")
            }
            
            
        })
        
        
    }
    @IBAction func NotificationButton1(_ sender: Any) {
        
        if allowControl{
            let contents1 = UNMutableNotificationContent()
            contents1.title = "title1"
            contents1.subtitle = "title2"
            contents1.body = "Message"
            contents1.badge = 1
            contents1.sound = UNNotificationSound.default
            
            let triggerr = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let requestNotification  = UNNotificationRequest(identifier: "Notification", content: contents1, trigger: triggerr)
            UNUserNotificationCenter.current().add(requestNotification, withCompletionHandler: nil)
        }
        
    }
}
extension ViewController: UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.badge,.sound])
    }
}
