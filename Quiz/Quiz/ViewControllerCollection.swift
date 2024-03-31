//
//  ViewControllerCollection.swift
//  Quiz
//
//  Created by Eren Çetintaş on 24.02.2024.
//

import UIKit
import Firebase
class ViewControllerCollection: UIViewController {
    var collectionImages = [Collection]()
    var collectionImages2 = [Collection2]()
    let k = Collection(collectionImage: "GenelKültür1")
    let k2 = Collection(collectionImage: "GenelKültür2")
    let k3 = Collection(collectionImage: "GenelKültür3")
    let k4 = Collection(collectionImage: "GenelKültür4")
    let k5 = Collection2(collectionImage2: "Spor1")
    let k6 = Collection2(collectionImage2: "Spor2")
    let k7 = Collection2(collectionImage2: "Spor3")
    let k8 = Collection2(collectionImage2: "Spor4")
    var idDocument = [QueryDocumentSnapshot]()
    @IBOutlet weak var collectionQuestion: UICollectionView!
    var quizViewController = QuizViewController() // Örnek oluşturur
   
    @IBOutlet weak var CollectionQuestion2: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let backgroundImage = UIImageView(frame: collectionQuestion.bounds)
           backgroundImage.image = UIImage(named: "SoruSecim")
           
           // Görüntünün ölçeklendirilmesini ayarlar
           backgroundImage.contentMode = .scaleAspectFill
           
           // Görüntüyü arka plana ekler
           collectionQuestion.backgroundView = backgroundImage
        
        let backgroundImage2 = UIImageView(frame: CollectionQuestion2.bounds)
           backgroundImage2.image = UIImage(named: "SoruSecim")
           
           // Görüntünün ölçeklendirilmesini ayarlar
           backgroundImage2.contentMode = .scaleAspectFill
           
           // Görüntüyü arka plana ekler
           CollectionQuestion2.backgroundView = backgroundImage2
        collectionImages.append(k)
        collectionImages.append(k2)
        collectionImages.append(k3)
        collectionImages.append(k4)
        collectionImages2.append(k5)
        collectionImages2.append(k6)
        collectionImages2.append(k7)
        collectionImages2.append(k8)
        if let layout1 = collectionQuestion.collectionViewLayout as? UICollectionViewFlowLayout {
            layout1.scrollDirection = .horizontal
            layout1.minimumInteritemSpacing = 20 // İki resim arasındaki boşluğu ayarlar
                layout1.minimumLineSpacing = 10 // Satırlar arası boşluğu belirler
            layout1.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
                layout1.itemSize = CGSize(width: 250, height: 250) // Hücre boyutlarını ayarlar
        }
        if let layout2 = CollectionQuestion2.collectionViewLayout as? UICollectionViewFlowLayout {
            layout2.scrollDirection = .horizontal
            layout2.minimumInteritemSpacing = 20 // İki resim arasındaki boşluğu ayarlar
                layout2.minimumLineSpacing = 10 // Satırlar arası boşluğu belirler
            layout2.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
                layout2.itemSize = CGSize(width: 250, height: 250) // Hücre boyutlarını ayarlar
        }
        
        
        
        collectionQuestion.delegate = self
        collectionQuestion.dataSource = self
        CollectionQuestion2.delegate = self
        CollectionQuestion2.dataSource = self
        CollectionQuestion2.isHidden = false
        
    }
    
    @IBAction func BackToTabBar(_ sender: Any) {
    }
    
    
}

extension ViewControllerCollection: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionQuestion {
            return collectionImages.count}
        
        else
        
        { return collectionImages2.count }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        if collectionView == collectionQuestion {
            let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! CollectionViewCell
            let imageName = collectionImages[indexPath.row]
            mainCell.question2023Image.image = UIImage(named: imageName.collectionImage!)
            cell = mainCell
        } else {
            let mainCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell2", for: indexPath) as! CollectionViewCell2
            let imageName = collectionImages2[indexPath.row]
            mainCell2.question2023Image2.image = UIImage(named: imageName.collectionImage2!)
            
            cell = mainCell2
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionQuestion {
            if indexPath.row == 0 {
                
                performSegue(withIdentifier: "toQuestions", sender: "Question")
                //self.quizViewController.selectedCollectionName = "Question"
                
            } else if indexPath.row == 1 {
                
                performSegue(withIdentifier: "toQuestions", sender: "Question2")
                //self.quizViewController.selectedCollectionName = "QuestionSport1"
            }
            else if indexPath.row == 2 {
                
                performSegue(withIdentifier: "toQuestions", sender: "Question3")
                //self.quizViewController.selectedCollectionName = "QuestionSport1"
            }
            
            else if indexPath.row == 3 {
                
                performSegue(withIdentifier: "toQuestions", sender: "Question4")
                //self.quizViewController.selectedCollectionName = "QuestionSport1"
            }
            
        } else {
            if indexPath.row == 0 {
                performSegue(withIdentifier: "toQuestions", sender: "QuestionSport1")
            } else if indexPath.row == 1 {
                performSegue(withIdentifier: "toQuestions", sender: "QuestionSport2")
            }
            else if indexPath.row == 2 {
                performSegue(withIdentifier: "toQuestions", sender: "QuestionSport3")
            }
            else if indexPath.row == 3 {
                performSegue(withIdentifier: "toQuestions", sender: "QuestionSport4")
            }
        }
        
        
        
        //  performSegue(withIdentifier: "toQuestions", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestions" {
                if let controlVC = segue.destination as? QuizViewController, let category = sender as? String {
                    controlVC.selectedCollectionName = category
                }
            } else if segue.identifier == "toFinishedQuestion" {
                if let finishedVC = segue.destination as? ViewControllerFinished, let category2 = sender as? String {
                    finishedVC.selectedCollectionName = category2
                }
            }
    }
    
    
    
    
}
