//
//  ViewControllerCollection.swift
//  Quiz
//
//  Created by Eren Çetintaş on 24.02.2024.
//
/*
import UIKit

class ViewControllerCollection: UIViewController {

    @IBOutlet weak var collectionQuestion: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionQuestion.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mainCell")

        collectionQuestion.delegate = self
        collectionQuestion.dataSource = self
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
extension ViewControllerCollection: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! CollectionViewCell
        cell.question2023Image.image = UIImage(named: "kpss")
        return cell
        
    }
    
    
    
    
    
    
 }*/
