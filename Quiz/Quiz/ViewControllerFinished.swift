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
    var selectedCollectionName = ""
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var finishedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

       
    
        
        finishedLabel.text = receivedScore
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlar
              backgroundImage.image = UIImage(named: "Home2")
              
              // Görüntünün arka planda görünmesini sağlar
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekler
              self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func completeLabel(_ sender: Any) {

            performSegue(withIdentifier: "ToQuestionSelect", sender: nil)
        }
     

    
    @IBAction func nextQuestionLabel(_ sender: Any) {
        
       
        
        
    }
}
    
    
   

