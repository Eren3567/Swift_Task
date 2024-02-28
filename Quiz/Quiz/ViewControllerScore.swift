//
//  ViewControllerScore.swift
//  Quiz
//
//  Created by Eren Çetintaş on 20.02.2024.
//

import UIKit
import Firebase
import FirebaseFirestore

var collectionImages = [Collection]()




class ViewControllerScore: UIViewController {
  
    var username: String?
   
    @IBOutlet weak var Table: UITableView!
    var scores = [Profile]() // Firestore'dan alınan skorları tutacak dizi

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
                  
                  // Arka plan görüntüsünü ayarlayın
                  backgroundImage.image = UIImage(named: "main2")
                  
                  // Görüntünün arka planda görünmesini sağlayın
                  backgroundImage.contentMode = .scaleAspectFill
                  
                  // Görüntüyü arka plana ekleyin
                  self.view.insertSubview(backgroundImage, at: 0)
            
            fetchScoresFromFirestore()
            Table.delegate = self
            Table.dataSource = self
            //collecttion.delegate = self
   // collecttion.dataSource = self
           

     }
    func fetchScoresFromFirestore() {
            let db = Firestore.firestore()
            db.collection("scores").getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching scores: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No scores found")
                    return
                }
                
                for document in documents {
                    // Her bir belge içindeki verilere erişir
                    let data = document.data()
                    
                    let userEmail = data["userEmail"] as? String ?? ""
                    let scoreValue = data["score"] as? Int ?? 0
                    let timestamp = data["date"] as? Timestamp ?? Timestamp()
                    
                    // "user" belgesine erişerek kullanıcı adını alırız
                    let userId = data["userID"] as? String ?? ""
                    db.collection("users").document(userId).getDocument { (userDocument, userError) in
                        if let userError = userError {
                            print("Error fetching user: \(userError.localizedDescription)")
                            return
                        }
                        
                        if let userData = userDocument?.data() {
                            let username = userData["username"] as? String ?? ""
                            
                            // Oluşturulan verilerle bir Score yapısı oluşturur
                            let score = Profile(userNameLabel1: userEmail, scoreLabel1: scoreValue, dateLabel1: timestamp, username1: username)
                            
                            // Daha sonra bu skoru scores dizisine ekleyin veya başka bir işlem yapar
                            self.scores.append(score)
                            
                            // Firestore'dan çekilen skorlar diziye atandı, TableView'i günceller
                            self.Table.reloadData()
                        }
                    }
                }
            }
        }

 }

extension ViewControllerScore: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let score = scores[indexPath.row]

        if let userEmail = score.userNameLabel1 {
            cell.userNameLabel.text = "Mail Adresi: \(userEmail)"
        } else {
            cell.userNameLabel.text = "Mail Adresi: Bilinmiyor"
        }
        cell.scoreLabel.text = "Aldığı Puan:\(String(score.scoreLabel1))"
        cell.dateLabel.text = "Puanı Aldığı Tarih:\(dateToString(timestamp: score.dateLabel1!))"
        if let username = score.username1 {
            cell.username.text = "Kullanıcı Adı: \(username)"
        } else {
            cell.username.text = "Kullanıcı Adı: Bilinmiyor"
        }
        return cell
    }
    
    func dateToString(timestamp:Timestamp)->String{
        let date = timestamp.dateValue()

        // DateFormatter oluşturun ve istediğiniz tarih biçimini belirler
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy" // Tarih biçimini ayarlayın (örneğin, "11 Mar 2023")

        // Tarih biçimlendirme işlemini gerçekleştirin
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

/*extension ViewControllerScore:UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.imagemart.image = UIImage(named: "kpss")
        return cell
    }
    
   
 }*/
