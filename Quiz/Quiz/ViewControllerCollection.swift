//
//  ViewControllerCollection.swift
//  Quiz
//
//  Created by Eren Çetintaş on 24.02.2024.
//

import UIKit

class ViewControllerCollection: UIViewController {
    var collectionImages = [Collection]()

    let k = Collection(collectionImage: "kpss")
    let k2 = Collection(collectionImage: "main2")
    @IBOutlet weak var collectionQuestion: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionImages.append(k)
        collectionImages.append(k2)
       
        let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal // Yatay kaydırma özelliğini etkinleştirir
          collectionQuestion.collectionViewLayout = layout
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
              
              // Arka plan görüntüsünü ayarlar
              backgroundImage.image = UIImage(named: "main3")
              
              // Görüntünün arka planda görünmesini sağlar
              backgroundImage.contentMode = .scaleAspectFill
              
              // Görüntüyü arka plana ekler
              self.view.insertSubview(backgroundImage, at: 0)
        
        collectionQuestion.delegate = self
        collectionQuestion.dataSource = self
        
    }
    

    
}
extension ViewControllerCollection: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! CollectionViewCell
        
        // IndexPath'e göre, dizideki ilgili resmin adını al
              let imageName = collectionImages[indexPath.row]
        cell.question2023Image.image = UIImage(named: imageName.collectionImage!)
       
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        performSegue(withIdentifier: "toQuestions", sender: nil)
        
    }
    
    
    
    
 }
extension ViewControllerCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size // Hücre boyutu koleksiyonun boyutuna eşit olmalıyı sağlar
    }
    
   
}
