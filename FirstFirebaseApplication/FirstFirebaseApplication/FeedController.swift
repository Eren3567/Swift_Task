//
//  FeedController.swift
//  FirstFirebaseApplication
//
//  Created by Eren Çetintaş on 31.12.2023.
//

import UIKit
import Firebase
import SDWebImage
class FeedController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var emailDizisi = [String]()
    var yorumDizisi = [String]()
    var gorselDizisi = [String]()
    
    
    
    @IBOutlet weak var Tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        Tableview.delegate = self
        Tableview.dataSource = self
        verial()
    }
    
    func verial(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("Post").addSnapshotListener {(snapshot, Error) in
            if Error != nil {
                print(Error?.localizedDescription as Any)
                
            }else{
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents  {
                       // let documentId = document.documentID
                        if let gorselUrl = document.get("gorselurl") as? String {
                            
                            self.gorselDizisi.append(gorselUrl)
                        }
                        
                        if let yorum = document.get("yorum") as? String {
                            
                            self.yorumDizisi.append(yorum)
                        }
                        
                        if let email = document.get("email") as?  String {
                            self.emailDizisi.append(email)
                        }
                    }
                    self.Tableview.reloadData()
                    
                    
                    
                    
                    
                    
                }
                
                
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  emailDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailtext2.text = emailDizisi[indexPath.row]
        cell.KullanıcıYorumuText.text = yorumDizisi[indexPath.row]
        cell.imageview.sd_setImage(with: URL(string: self.gorselDizisi[indexPath.row]))
        return cell
        
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
