//
//  ViewControllerAllScores.swift
//  Quiz
//
//  Created by Eren Çetintaş on 18.04.2024.
//

import UIKit
import Firebase
class ViewControllerAllScores: UIViewController {
    @IBOutlet weak var TableviewAllscores: UITableView!
    var scores = [Profile]() // Firestore'dan alınan skorları tutacak dizi
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        // Arka plan görüntüsünü ayarlar
        backgroundImage.image = UIImage(named: "Home2")
        
        // Görüntünün arka planda görünmesini sağlar
        backgroundImage.contentMode = .scaleAspectFill
        
        // Görüntüyü arka plana ekler
        self.view.insertSubview(backgroundImage, at: 0)
        fetchScoresFromFirestore()
     TableviewAllscores.delegate = self
        TableviewAllscores.dataSource = self
        
        
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
                let data = document.data()
                
                let userEmail = data["userEmail"] as? String ?? ""
                let scoreValue = data["score"] as? Int ?? 0
                let timestamp = data["date"] as? Timestamp ?? Timestamp()
                let userId = data["userID"] as? String ?? ""
                
                db.collection("users").document(userId).getDocument { (userDocument, userError) in
                    if let userError = userError {
                        print("Error fetching user: \(userError.localizedDescription)")
                        return
                    }
                    
                    if let userData = userDocument?.data() {
                        let username = userData["username"] as? String ?? ""
                        let score = Profile(userNameLabel1: userEmail, scoreLabel1: scoreValue, dateLabel1: timestamp, username1: username)
                        self.scores.append(score)
                        
                        self.TableviewAllscores.reloadData()
                    }
                }
            }
        }
    }
}
    extension ViewControllerAllScores: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return scores.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! TableViewCellAllScores
            let score = scores[indexPath.row]

           // if let userEmail = score.userNameLabel1 {
          //      cell.userNameLabel.text = "Mail Adresi: \(userEmail)"
           // } else {
           //     cell.userNameLabel.text = "Mail Adresi: Bilinmiyor"
           // }
            cell.UserName.text = "Oyuncu Adı: \(score.username1 ?? "name")"
            cell.UserScore.text = "Aldığı Puan: \(String(score.scoreLabel1))"
            cell.UserDate.text = "Puanı Aldığı Tarih: \(dateToString(timestamp: score.dateLabel1!))"
          //  if let username = score.username1 {
          //      cell.username.text = "Kullanıcı Adı: \(username)"
          //  } else {
          //      cell.username.text = "Kullanıcı Adı: Bilinmiyor"
         //   }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
