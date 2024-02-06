//
//  ViewController2.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import UIKit

class ViewController2: UIViewController {
    var name = ""
    var titlename = ""
    var imageimage = ""
    var iconImageNames: [String] = [] // ViewController'dan alınacak resim adları
    var isYellow = false
    
    @IBOutlet weak var iconimage2: UIImageView!
    
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Image2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Label3.text = name
        Label4.text = titlename
        Image2.image = UIImage(named: imageimage)
      
        iconimage2.image = UIImage(named: iconImageNames[0])
        
        iconimage2.isUserInteractionEnabled = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconImageTapped))
                
                iconimage2.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(iconImageTapped2))
        
                Label3.addGestureRecognizer(tapGesture2)
       
        
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
        
        print("click the icon")
            if isYellow {
                // Eğer sarı renk varsa, sarı rengi kaldır
                iconimage2.tintColor = UIColor.clear
                isYellow = false
            } else {
                // Sarı renk yoksa, sarı rengi ekle
                iconimage2.tintColor = UIColor.yellow
                isYellow = true
            }
        }
    @objc func iconImageTapped2() {
            if isYellow {
                // Eğer sarı renk varsa, sarı rengi kaldır
                Label3.tintColor = UIColor.clear
                isYellow = false
            } else {
                // Sarı renk yoksa, sarı rengi ekle
                Label3.tintColor = UIColor.yellow
                isYellow = true
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


