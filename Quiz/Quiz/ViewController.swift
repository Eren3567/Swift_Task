//
//  ViewController.swift
//  Quiz
//
//  Created by Eren Çetintaş on 9.02.2024.
//

import UIKit
import Firebase
import FirebaseAuth





class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlayın
              backgroundImage.image = UIImage(named: "main")
              
              // Görüntünün arka planda görünmesini sağlayın
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekleyin
              self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        guard let email = emailText.text, !email.isEmpty,
                      let password = passwordText.text, !password.isEmpty else {
                // E-posta veya parola alanları boşsa hata mesajı göster
                errorMessage(title: "Error", message: "Please enter email and password")
                return
            }
            
            // Kullanıcı adı alanı doluysa, Firestore'dan kullanıcı adını alıp kontrol et
            if let username = usernameText.text, !username.isEmpty {
                signIn(email: email, password: password)
            } else {
                // Kullanıcı adı alanı boşsa hata mesajı göster
                errorMessage(title: "Error", message: "Please enter username")
            }
    }
    
    func checkUsernameAndSignIn(email: String, password: String, username: String) {
        let db = Firestore.firestore()
        guard let currentUser = Auth.auth().currentUser else {
            print("No logged in user")
            return
        }
        
        // Firestore'dan kullanıcı adını al
        db.collection("users").document(currentUser.uid).getDocument { (document, error) in
            if let error = error {
                print("Error fetching username from Firestore: \(error.localizedDescription)")
                return
            }
            
            if let document = document, document.exists {
                // Firestore'da kullanıcı adı varsa ve giriş yapılan kullanıcı adıyla eşleşiyorsa giriş yap
                let userData = document.data()
                let fetchedUsername = userData?["username"] as? String ?? ""
                if fetchedUsername == username {
                    self.signIn(email: email, password: password)
                } else {
                    // Firestore'daki kullanıcı adı giriş yapılan kullanıcı adıyla eşleşmiyorsa hata mesajı göster
                    self.errorMessage(title: "Error", message: "Username does not match")
                }
            } else {
                // Firestore'da kullanıcı adı bulunamazsa hata mesajı göster
                self.errorMessage(title: "Error", message: "Username not found")
            }
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (AuthDataResult, error )in
            if let error = error {
                self.errorMessage(title: "Error", message: error.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "ToFeedVc", sender: nil)
            }
        }
    }
    
    @IBAction func SigninButton(_ sender: Any) {
        guard let email = emailText.text, !email.isEmpty,
                  let password = passwordText.text, !password.isEmpty,
                  let username = usernameText.text, !username.isEmpty else {
                // E-posta, parola veya kullanıcı adı alanları boşsa hata mesajı göster
            errorMessage(title: "Error", message: "Please enter email, username, and password")
                return
            }
            
            // Kullanıcı adının geçerli olup olmadığını kontrol et
            if !isValidUsername(username) {
                errorMessage(title: "Error", message: "Invalid username format")
                return
            }
            
        
            // E-posta ve parola alanları doluysa kullanıcıyı kaydet
            Auth.auth().createUser(withEmail: email, password: password) { (AuthDataResult, Error) in
                if let error = Error {
                    // Kullanıcı oluşturma başarısız olduysa hata mesajı göster
                    self.errorMessage(title: "Error", message: error.localizedDescription)
                } else {
                    // Kullanıcı başarıyla oluşturulduysa başarılı mesajı göster
                    self.successMessage(titleinput: "Success", messageinput: "You have successfully registered.")
                    
                    // Text alanlarını temizle
                    self.emailText.text = ""
                    self.passwordText.text = ""
                    self.usernameText.text = ""
                    self.saveUsernameToFirestore(username)
                }
            }
    }
    func saveUsernameToFirestore(_ username: String) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("Current user not found")
            return
        }
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userID)
        
        userRef.setData(["username": username], merge: true) { error in
            if let error = error {
                print("Error saving username to Firestore: \(error.localizedDescription)")
            } else {
                print("Username saved to Firestore successfully.")
            }
        }
    }

    func successMessage(titleinput: String, messageinput : String) {
        let alert = UIAlertController(title: titleinput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
        let Okbut = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(Okbut)
        self.present(alert, animated: true, completion: nil)
    }
    func isValidUsername(_ username: String) -> Bool {
        // Burada kullanıcı adının geçerli olup olmadığını kontrol edebilirsiniz
        // Örneğin, istediğiniz doğrulamayı gerçekleştirebilirsiniz
        // Bu örnekte sadece boş olmamasını kontrol ediyoruz
        return !username.isEmpty
    }
    
    func errorMessage(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
       }
    @IBAction func forgetPassword(_ sender: Any) {
        guard let email = emailText.text, !email.isEmpty else {
                          errorMessage(title: "Error", message: "Enter your email address")
                          return
                      }
                      
                      Auth.auth().sendPasswordReset(withEmail: email) { error in
                          if let error = error {
                              self.errorMessage(title: "Error", message: error.localizedDescription)
                          } else {
                              self.errorMessage(title: "Success", message: "Password reset email has been sent")
                          }
                      }
    }
}
