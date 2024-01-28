//
//  ViewController.swift
//  DetailCollectionView
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import UIKit

class ViewController: UIViewController {
var FilmArray = [Class1]()
    var selectimage = ""
    var selectname = ""
    @IBOutlet weak var Collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let design : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.Collection.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumLineSpacing = 10
        design.minimumLineSpacing = 10
        let CellWidth = (width-30)/2
        
        
        design.itemSize = CGSize(width: CellWidth, height: CellWidth*1.85)
        Collection!.collectionViewLayout = design
        
        Collection.delegate = self
        Collection.dataSource = self
        
        let k1 = Class1(FilmImageName: "Picture_1",FilmTitle: "Film_1", FilmId: 1,FilmPrice: 20.0)
        let k2 = Class1(FilmImageName: "Picture_3",FilmTitle: "Film_3", FilmId: 2,FilmPrice: 20.0)
        let k3 = Class1(FilmImageName: "Picture_4",FilmTitle: "Film_4", FilmId: 3,FilmPrice: 20.0)
        
        let k4 = Class1(FilmImageName: "Picture_5",FilmTitle: "Film_5", FilmId: 4,FilmPrice: 20.0)
        let k5 = Class1(FilmImageName: "Picture_6",FilmTitle: "Film_6", FilmId: 5,FilmPrice: 20.0)
        let k6 = Class1(FilmImageName: "Picture_7",FilmTitle: "Film_7", FilmId: 6,FilmPrice: 20.0)
        let k7 = Class1(FilmImageName: "Picture_8",FilmTitle: "Film_8", FilmId: 7,FilmPrice: 20.0)
        let k8 = Class1(FilmImageName: "Picture_9",FilmTitle: "Film_9", FilmId: 8,FilmPrice : 20.0)
        
        FilmArray.append(k1)
        FilmArray.append(k2)
        FilmArray.append(k3)
        FilmArray.append(k4)
        FilmArray.append(k5)
        FilmArray.append(k6)
        FilmArray.append(k7)
        FilmArray.append(k8)
        

        
    }
    
    


}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellProtocol {
    func BuyProtocol(indexpath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilmArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let getArray = FilmArray[indexPath.row]
        let cell = Collection.dequeueReusableCell(withReuseIdentifier: "VcCollection", for: indexPath) as! CollectionViewCell
        cell.FilmName.text = getArray.FilmTitle
        cell.Image.image = UIImage(named: getArray.FilmImageName)
        cell.FilmPrice.text = String(format: "%.2f", getArray.FilmPrice!)


        
        return cell
        
   
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let getArray = FilmArray[indexPath.row]
        
        selectname = getArray.FilmTitle
        selectimage = getArray.FilmImageName
        
        performSegue(withIdentifier: "Vc", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Vc" {
            
            let destination = segue.destination as! ViewController2
            
            destination.Image2image = selectimage
            destination.Label4Text = selectname
            
        }
    }
    
    
    
    
}
