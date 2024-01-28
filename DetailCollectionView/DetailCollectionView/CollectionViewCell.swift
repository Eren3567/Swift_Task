//
//  CollectionViewCell.swift
//  DetailCollectionView
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import UIKit

protocol CollectionViewCellProtocol {
 
    func BuyProtocol (indexpath : IndexPath)
    
}


class CollectionViewCell: UICollectionViewCell {
    var ProtocolAdd : CollectionViewCellProtocol?
    var indexpath   : IndexPath?
    
    
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var FilmPrice: UILabel!
    @IBOutlet weak var FilmName: UILabel!
  
    @IBAction func Buy(_ sender: Any) {
        
        
        ProtocolAdd?.BuyProtocol(indexpath: indexpath!)
        
        
        
    }
}
