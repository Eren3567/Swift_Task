//
//  ViewController2.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class ViewController2: UIViewController {
    var name = ""
    var titlename = ""
    var imageimage = ""
    @IBOutlet weak var staryellowlabel: UIButton!
    @IBOutlet weak var labelstarbutton: UILabel!
    //var iconImageNames = "star_3794158"// ViewController'dan alınacak resim adları
    var isYellow = false
    var iconImageNames: [String] = []
    @IBOutlet weak var LabelStar: UINavigationItem!
    @IBOutlet weak var iconimage2: UIImageView!
    
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Image2: UIImageView!
    let db = Firestore.firestore()
    let storage = Storage.storage()
    override func viewDidLoad() {
        super.viewDidLoad()
        Label3.text = name
        Label4.text = titlename
        Image2.image = UIImage(named: imageimage)
        
       
        // Gesture Recognizer eklemek için iconimage2 üzerinde kullanıcı etkileşimini etkinleştir
               iconimage2.isUserInteractionEnabled = true
               
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconImageTapped))
               iconimage2.addGestureRecognizer(tapGesture)
               
               // iconImageNames dizisinden bir resim adını iconimage2'ye ata
      
        if let imageUrl = URL(string: self.imageimage) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.Image2.image = UIImage(data: imageData)
                    }
                }
            }
        }
        /*  DispatchQueue.main.async{
         if let imageURL = URL(string: self.imageimage),
         let imageData = try? Data(contentsOf: imageURL),
         let image = UIImage(data: imageData) {
         self.Image2.image = image
         }
         }
         
         */
        
      
            
            
       
        
        
    }
    
    
    
        @objc func iconImageTapped() {
                if isYellow {
                    // Eğer sarı renk varsa, sarı rengi kaldır
                    iconimage2.backgroundColor = UIColor.clear
                    isYellow = false
                } else {
                    // Sarı renk yoksa, sarı rengi ekle
                    iconimage2.backgroundColor = UIColor.yellow
                    isYellow = true
                    // Storage'a resmi yükle
                    uploadImageToStorage()
                }
            }
          
        func uploadImageToStorage() {
                // Resmin veri halini al
                guard let imageData = iconimage2.image?.jpegData(compressionQuality: 0.8) else {
                    print("Failed to convert image to data")
                    return
                }
                
                // Resmin adını belirle
                let imageName = "image.jpg"
                
                // Storage'da resmin referansını oluştur
                let storageRef = storage.reference().child(imageName)
                
                // Resmi Storage'a yükle
                storageRef.putData(imageData, metadata: nil) { metadata, error in
                    if let error = error {
                        print("Error uploading image to Storage: \(error.localizedDescription)")
                        return
                    }
                    
                    print("Image uploaded successfully")
                    
                    // Yükleme tamamlandıktan sonra isterseniz başka işlemler yapabilirsiniz
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


