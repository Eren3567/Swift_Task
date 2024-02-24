//
//  ViewControllerFinished.swift
//  Quiz
//
//  Created by Eren Çetintaş on 18.02.2024.
//

import UIKit
import Firebase
class ViewControllerFinished: UIViewController {
var receivedScore = ""
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var finishedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        finishedLabel.text = receivedScore
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlayın
              backgroundImage.image = UIImage(named: "main2")
              
              // Görüntünün arka planda görünmesini sağlayın
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekleyin
              self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func completeLabel(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toBackMain", sender: nil)
        }
        
        catch{
           print("Hatalı")
        }
        
    }
    

    }
    
    
   

