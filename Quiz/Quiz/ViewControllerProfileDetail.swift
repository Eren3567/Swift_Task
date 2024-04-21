//
//  ViewControllerProfileDetail.swift
//  Quiz
//
//  Created by Eren Çetintaş on 2.03.2024.
//

import UIKit
import Firebase
class ViewControllerProfileDetail: UIViewController {
 
    @IBOutlet weak var KisiselBilgiLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var userEmail : String? // Kullanıcının e-postasını saklamak için bir değişken tanımlanır
    var username : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
               let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlar
              backgroundImage.image = UIImage(named: "Home2")
              
              // Görüntünün arka planda görünmesini sağlar
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekler
              self.view.insertSubview(backgroundImage, at: 0)
        
        if let email = userEmail {
            KisiselBilgiLabel.text = email
        }
        
        if let name = username {
            userNameLabel.text = name
        }
    }
    @IBAction func changePassword(_ sender: Any) {
  showChangePasswordAlert()
    }
        
    func showChangePasswordAlert() {
            let alertController = UIAlertController(title: "Parola Değiştir", message: "Yeni parolanızı girin", preferredStyle: .alert)
            
            alertController.addTextField { textField in
                textField.placeholder = "Yeni Parola"
                textField.isSecureTextEntry = true
            }
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
            let changePasswordAction = UIAlertAction(title: "Değiştir", style: .default) { [weak self] _ in
                guard let self = self else { return }
                if let newPassword = alertController.textFields?.first?.text {
                    self.changePassword(newPassword)
                }
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(changePasswordAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
        func changePassword(_ newPassword: String) {
            let user = Auth.auth().currentUser
            
            user?.updatePassword(to: newPassword) { [weak self] error in
                guard let self = self else { return }
                
                if let error = error {
                    // Parola değiştirme işlemi başarısız oldu
                    print("Parola değiştirme hatası: \(error.localizedDescription)")
                    let errorAlert = UIAlertController(title: "Hata", message: "Parolanızı değiştirirken bir hata oluştu: \(error.localizedDescription)", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    errorAlert.addAction(okAction)
                    self.present(errorAlert, animated: true, completion: nil)
                } else {
                    // Parola değiştirme işlemi başarılı
                    print("Parola başarıyla değiştirildi.")
                    let successAlert = UIAlertController(title: "Başarılı", message: "Parolanız başarıyla değiştirildi.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    successAlert.addAction(okAction)
                    self.present(successAlert, animated: true, completion: nil)
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


