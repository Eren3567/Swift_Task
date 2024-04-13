//
//  TableViewCell.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import UIKit
import FirebaseStorage
protocol StarIconDelegate: AnyObject {
    func starIconTapped(at indexPath: IndexPath)
}
class TableViewCell: UITableViewCell {
    
    weak var delegate: StarIconDelegate?
        var indexPath: IndexPath?
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var iconimage1: UIImageView!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var Label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        ImageView.layer.cornerRadius = 10 // veya istediğiniz bir değer
        ImageView.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setImageFromFirestore() {
           let storage = Storage.storage() // Firebase Storage nesnesini oluştur
           let storageRef = storage.reference() // Firebase Storage referansını al
           
           // Resmin bulunduğu referansı belirt
           let imageRef = storageRef.child("images/image1.jpg")
           
           // Resmi indir
           imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
               if let error = error {
                   print("Error downloading image: \(error.localizedDescription)")
               } else {
                   // İndirilen veriyi UIImage olarak oluştur
                   if let imageData = data, let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           // UIImage'i kullanarak iconimage1 görünümüne ata
                           self.iconimage1.image = image
                       }
                   } else {
                       print("Error creating image from data.")
                   }
               }
           }
       }
}
