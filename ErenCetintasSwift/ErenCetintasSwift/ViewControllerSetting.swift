//
//  ViewControllerSetting.swift
//  ErenCetintasSwift
//
//  Created by Eren Çetintaş on 21.01.2024.
//

import UIKit
import Firebase
class ViewControllerSetting: UIViewController {

    @IBOutlet weak var receiverIdTextField: UITextField!
    
    @IBOutlet weak var messageTextField: UITextField!
   
    var ref: DatabaseReference!
    @IBOutlet weak var exit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Firebase konfigürasyonu
               FirebaseApp.configure()
               
               // Firebase veritabanı referansı
               ref = Database.database().reference()
           }
    
    

    @IBAction func sendMessage(_ sender: Any) {   
        guard let message = messageTextField.text,
       let receiverId = receiverIdTextField.text,
     !message.isEmpty,
    !receiverId.isEmpty else {
print("Lütfen bir mesaj ve alıcı ID'si girin.")
  return}
                                                  
  // Mesajı Firebase veritabanına gönderme
sendMessage(message: message, receiverId: receiverId)
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
        func sendMessage(message: String, receiverId: String) {
                let messageData = [
                    "senderId": Auth.auth().currentUser?.uid ?? "", // Mesajı gönderen kullanıcının UID'si
                    "message": message
                ]
                ref.child("messages").child(receiverId).childByAutoId().setValue(messageData) { (error, _) in
                    if let error = error {
                        print("Mesaj gönderilirken bir hata oluştu: \(error.localizedDescription)")
                    } else {
                        print("Mesaj başarıyla gönderildi.")
                    }
                }
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

