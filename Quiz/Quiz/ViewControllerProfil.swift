//
//  ViewControllerProfil.swift
//  Quiz
//
//  Created by Eren Çetintaş on 29.02.2024.
//

import UIKit
import Firebase
class ViewControllerProfil: UIViewController {
    @IBOutlet weak var KişiselBilgi: UILabel!
    
    
    @IBOutlet weak var HesabımıSilLabel: UILabel!
    @IBOutlet weak var UygulamaHakkındaLabel: UILabel!
    @IBOutlet weak var SınavlarımLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlar
              backgroundImage.image = UIImage(named: "Home2")
              
              // Görüntünün arka planda görünmesini sağlar
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekler
              self.view.insertSubview(backgroundImage, at: 0)
        fetchUserDetailsFromAuthentication()
        // SınavlarımLabel'a bir UITapGestureRecognizer ekleyerek tıklama algılamasını sağlar
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sınavlarımLabelTapped))
        SınavlarımLabel.isUserInteractionEnabled = true
        SınavlarımLabel.addGestureRecognizer(tapGestureRecognizer)
        // Hesabımı Sil Label'a bir UITapGestureRecognizer ekleyerek tıklama algılamasını sağla
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(hesabıSilLabelTapped))
        HesabımıSilLabel.isUserInteractionEnabled = true
        HesabımıSilLabel.addGestureRecognizer(tapGestureRecognizer2)
        
        
        // KisiselBilgiLabel'a bir tıklama tanımlar
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(kisiselBilgiLabelTapped))
        KişiselBilgi.isUserInteractionEnabled = true
        KişiselBilgi.addGestureRecognizer(tapGestureRecognizer3)
        
        // UygulamaHakkındaLabel'a bir UITapGestureRecognizer ekleyerek tıklama algılamasını sağlar
            let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(uygulamaHakkindaLabelTapped))
            UygulamaHakkındaLabel.isUserInteractionEnabled = true
            UygulamaHakkındaLabel.addGestureRecognizer(tapGestureRecognizer4)
        
    }
    

    // KisiselBilgiLabel etiketine tıklandığında çalışacak fonksiyon
        @objc func kisiselBilgiLabelTapped() {
         
            // Segue'yi başlatır
            performSegue(withIdentifier: "ToKisiselBilgilerDetay", sender: nil)
        }
    @objc func uygulamaHakkindaLabelTapped() {
        // Segue'yi başlatır
        performSegue(withIdentifier: "ToAboutApp", sender: nil)
    }
    // Firebase Authentication'dan kullanıcı bilgilerini alır
    func fetchUserDetailsFromAuthentication() {
        if let currentUser = Auth.auth().currentUser {
            let email = currentUser.email ?? "No email found"
           
        } else {
            // Oturum açmış bir kullanıcı yoksa uygun bir mesaj görüntüler
            KişiselBilgi.text = "Oturum açmış bir kullanıcı yok"
        }
    }
   
    func fetchUserDetailsFromFirestore(completion: @escaping (String?) -> Void) {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            print("Current user ID is nil.")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(currentUserID).getDocument { (userDocument, error) in
            if let error = error {
                print("Error fetching user document: \(error.localizedDescription)")
                completion(nil) // Hata durumunda completion çağrısını nil ile tamamlar
                return
            }
            
            if let userData = userDocument?.data(), let username = userData["username"] as? String {
                print("Username fetched from Firestore: \(username)")
                completion(username) // Kullanıcı adını başarıyla aldıktan sonra completion çağrısını username ile tamamlar
            }
            else {
                print("Username not found in Firestore.")
                completion(nil) // Kullanıcı adı bulunamazsa completion çağrısını nil ile tamamlar
            }
        }
    }

    func deleteAccount() {
        // Mevcut oturum açmış kullanıcıyı al
        if let user = Auth.auth().currentUser {
            // Kullanıcıyı sil
            user.delete { error in
                if let error = error {
                    // Hesap silinemedi, hata mesajını göster
                    self.errorMessage(title: "Error", message: error.localizedDescription)
                } else {
                    // Hesap başarıyla silindiğinde yapılacak işlemler
                    // Örneğin, kullanıcıya başarılı bir şekilde hesabın silindiği mesajını göster
                    self.successMessage(titleinput: "Success", messageinput: "Your account has been successfully deleted.")
                    
                    
                }
            }
        } else {
            // Mevcut oturum açmış kullanıcı yoksa hata mesajı göster
            errorMessage(title: "Error", message: "No logged in user.")
        }
    }
    func errorMessage(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
       }
    
    func successMessage(titleinput: String, messageinput : String) {
        let alert = UIAlertController(title: titleinput, message: messageinput, preferredStyle: UIAlertController.Style.alert)
        let Okbut = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(Okbut)
        self.present(alert, animated: true, completion: nil)
    }
    // Hesabımı Sil Label'a tıklandığında çalışacak fonksiyon
    @objc func hesabıSilLabelTapped() {
        // Uyarı göstererek kullanıcıdan hesabını silmek isteyip istemediğini onaylamasını ister
        let alertController = UIAlertController(title: "Hesap Silme", message: "Hesabınızı silmek istediğinizden emin misiniz?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Sil", style: .destructive) { _ in
            // Kullanıcının Firestore'daki verilerini silme fonksiyonunu çağırır
            self.deleteUserFirestoreData()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Firestore'da kullanıcıya ait verileri silen fonksiyon
    func deleteUserFirestoreData() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            // Kullanıcı oturumu açık değilse işlemi gerçekleştirmez.
            return
        }
        
        let db = Firestore.firestore()
        
        // Kullanıcının temel belgesini (örneğin, "users" koleksiyonu altındaki belgeyi) // Kullanıcının temel belgesini (örneğin, "users" koleksiyonu altındaki belgeyi) siler
        db.collection("users").document(currentUserID).delete { error in
            if let error = error {
                print("Kullanıcı belgesini silme hatası: \(error.localizedDescription)")
                return
            }
            
            // Kullanıcı belgesi başarıyla silindi.
            print("Kullanıcı belgesi başarıyla silindi.")
        }

        // Kullanıcının alt koleksiyonlarını (varsa) sierl
        self.deleteSubcollections(db: db, parentDocumentID: currentUserID)
        // Kullanıcının oturum açmış olup olmadığını kontrol eder
        if let userEmail = Auth.auth().currentUser?.email {
            // Oturum açmış kullanıcının e-posta adresini alır ve deleteScoresForUser fonksiyonuna geçirir
            deleteScoresForUser(userEmail: userEmail)
        } else {
            // Oturum açmış bir kullanıcı yoksa uygun bir mesaj görüntüler veya gerekli işlemleri yapar
            print("Oturum açmış bir kullanıcı yok")
        }
        deleteAccount()
    }
    // Kullanıcıya ait scores belgelerini silen fonksiyon
    func deleteScoresForUser(userEmail: String) {
        let db = Firestore.firestore()
        db.collection("scores").whereField("userEmail", isEqualTo: userEmail).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching scores: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No scores found for user with email: \(userEmail)")
                return
            }
            
            for document in documents {
                // Her bir skor belgesini sil
                db.collection("scores").document(document.documentID).delete { error in
                    if let error = error {
                        print("Error deleting score: \(error.localizedDescription)")
                        return
                    }
                    
                    print("Score deleted successfully")
                }
            }
        }
    }

    
    // Belirli bir belgeden alt koleksiyonları silen yardımcı fonksiyon
    func deleteSubcollections(db: Firestore, parentDocumentID: String) {
        // Verilen belgeye ait tüm alt koleksiyonları al
        db.collectionGroup(parentDocumentID).getDocuments { (snapshot, error) in
            if let error = error {
                print("Alt koleksiyonları alırken hata oluştu: \(error.localizedDescription)")
                return
            }
            
            // Alt koleksiyon içindeki belgeleri siler
            for document in snapshot!.documents {
                document.reference.delete()
            }
        }
    }
    // Belirli bir belgeden alt koleksiyonları silen yardımcı fonksiyon
    // Kullanıcıya ait scores belgelerini silen fonksiyon
    // Kullanıcıya ait scores belgelerini silen fonksiyon
    
    // SınavlarımLabel'a tıklandığında çalışacak fonksiyon
    @objc func sınavlarımLabelTapped() {
        
        performSegue(withIdentifier: "ToSinav", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToKisiselBilgilerDetay" {
            if let destinationVC = segue.destination as? ViewControllerProfileDetail {
                fetchUserDetailsFromFirestore { usernamee in
                    if let currentUser = Auth.auth().currentUser {
                        
                        // Firestore'dan kullanıcı adını ve e-postayı aldıktan sonra, etiketlere değer atanması burda yapılır.
                        destinationVC.KisiselBilgiLabel.text = currentUser.email
                        destinationVC.userNameLabel.text = usernamee
                    }
                }
            }
        }
    }


    @IBAction func SignOutButton(_ sender: Any) {
    }
    @IBAction func ToQuestionSelect(_ sender: Any) { do {
        try Auth.auth().signOut()
        performSegue(withIdentifier: "ToSignOut", sender: nil)
    }
    
    catch{
       print("Hatalı")
    }
    
    }
    
    }



    

