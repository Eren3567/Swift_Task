//
//  ViewController.swift
//  CollectionView
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {
    var letter = [String]()
    
    @IBOutlet weak var Collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let design : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.Collection.frame.size.width
        
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.itemSize = CGSize(width: (width-30)/3, height: (width-30)/3)
        design.minimumLineSpacing = 5
        design.minimumLineSpacing = 5
        
        Collection!.collectionViewLayout = design
        
        
        letter = ["aaaaaaaa","bbbbbb","cccccccc"]
        Collection.delegate = self
        Collection.dataSource = self
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return letter.count    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let  cell = Collection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.Celllabel.text = letter[indexPath.row]
        return cell
    }
    
    
    
    
    
}

