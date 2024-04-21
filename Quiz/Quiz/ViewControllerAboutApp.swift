//
//  ViewControllerAboutApp.swift
//  Quiz
//
//  Created by Eren Çetintaş on 9.03.2024.
//

import UIKit

class ViewControllerAboutApp: UIViewController {

    @IBOutlet weak var versionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlar
              backgroundImage.image = UIImage(named: "Home2")
              
              // Görüntünün arka planda görünmesini sağlar
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekler
              self.view.insertSubview(backgroundImage, at: 0)
        
        // Uygulama sürümünü alıp etiket üzerine yazdırma
                if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                    versionLabel.text = "Uygulama versiyonu " + version
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

}
